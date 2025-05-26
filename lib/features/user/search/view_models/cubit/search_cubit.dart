import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:fien/app/my_app.dart';
import 'package:fien/core/constants/app_constants.dart';
import 'package:fien/core/helper/clasify_image_with_gemini.dart';
import 'package:fien/core/helper/date_timr_helper.dart';
import 'package:fien/core/helper/filter_helper.dart';
import 'package:fien/core/helper/location_helper.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/network/api/end_points.dart';
import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.apiConsumer) : super(SearchInitial());

  final ApiConsumer apiConsumer;
  List<LostFoundItemModel> allItems = [];
  List<LostFoundItemModel> filteredItems = [];
  List<LostFoundItemModel> searchedItems = [];
  String classificationResult = '';
  final String apiKey = "AIzaSyCYWZ43nFnxRFrEPieQs6DefD68vtplnEs";
  int selectedCategoryIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime? filterByDate;
  TimeOfDay? filterByTime;
  String? selectedCategory;
  String? selectedLocation;

  // Getters for UI to show formatted date/time
  String get formattedDate => DateTimeHelper.formatDate(selectedDate);
  String get formattedTime => DateTimeHelper.formatTimeOfDay(
    selectedTime,
    navigatorKey.currentContext!,
  );

  /// Load all found items from API
  Future<void> loadFoundItems() async {
    emit(GetItemsLoading());
    try {
      final response = await apiConsumer.get(EndPoints.getFoundItems);
      if (response is List) {
        allItems =
            response.map((item) => LostFoundItemModel.fromJson(item)).toList();
        filteredItems = List.from(allItems);
        searchedItems = List.from(allItems);
        emit(GetItemsSuccess());
      } else {
        emit(GetItemsFailure(message: "Unexpected data format."));
      }
    } catch (e) {
      log('LoadFoundItems error: $e');
      emit(GetItemsFailure(message: e.toString()));
    }
  }

  /// Select category index by category value
  void selectCategory(String categoryValue) {
    selectedCategoryIndex = AppConstants.itemTypes.indexOf(categoryValue);
    selectedCategory = categoryValue;
    filterItems();
    emit(GetItemsSuccess());
  }

  /// Search items by text query
  void searchItemsByText(String query) {
    searchedItems =
        filteredItems
            .where(
              (item) => item.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    emit(GetItemsSuccess());
  }

  /// Search items by image classification
  Future<void> searchByImage({required File selectedImage}) async {
    try {
      if (allItems.isEmpty) {
        await loadFoundItems();
      }
      emit(GetItemsByImageLoading());

      final categoryNames = AppConstants.categories.map((e) => e.name).toList();
      classificationResult = await classifyImageWithGemini(
        selectedImage: selectedImage,
        categoryNames: categoryNames,
        apiKey: apiKey,
      );

      filteredItems =
          allItems
              .where(
                (item) =>
                    item.itemType.name.toLowerCase() ==
                    classificationResult.toLowerCase(),
              )
              .toList();

      searchedItems = List.from(filteredItems);
      emit(GetItemsByImageSuccess());
    } catch (e) {
      classificationResult = 'Error: ${e.toString()}';
      emit(GetItemsByImageFailure(message: e.toString()));
    }
  }

  /// Pick date using DateTimeHelper and update filters
  Future<void> pickDate() async {
    try {
      final pickedDate = await DateTimeHelper.pickDate(
        navigatorKey.currentContext!,
        initialDate: selectedDate ?? DateTime.now(),
      );
      if (pickedDate != null) {
        selectedDate = pickedDate;
        filterByDate = pickedDate;
        filterItems();
        emit(DateTimeUpdated(selectedDate, selectedTime));
      }
    } catch (e) {
      log('pickDate error: $e');
    }
  }

  /// Pick time using DateTimeHelper and update filters
  Future<void> pickTime() async {
    try {
      final pickedTime = await DateTimeHelper.pickTime(
        navigatorKey.currentContext!,
        initialTime: selectedTime ?? TimeOfDay.now(),
      );
      if (pickedTime != null) {
        selectedTime = pickedTime;
        filterByTime = pickedTime;
        filterItems();
        emit(DateTimeUpdated(selectedDate, selectedTime));
      }
    } catch (e) {
      log('pickTime error: $e');
    }
  }

  /// Select location and filter items accordingly
  void selectLocation(String? location) {
    selectedLocation = location;
    filterItems();
    emit(SelectLocationSuccess());
  }

  /// Filter items based on current filters
  void filterItems() {
    searchedItems = filterItemsHelper(
      items: filteredItems,
      selectedIndex: selectedCategoryIndex,
      selectedCategory: selectedCategory,
      selectedLocation: selectedLocation,
      filterByDate: filterByDate,
      filterByTime: filterByTime,
    );
    filteredItems = List.from(searchedItems);
    emit(GetItemsSuccess());
  }

  Future<void> updateCurrentLocation() async {
    emit(SelectLocationLoading());
    final position = await LocationHelper.getCurrentPosition();
    if (position == null) {
      emit(
        SelectLocationFailure(
          message: "Location permission denied or unavailable",
        ),
      );
      return;
    }
    final city = await LocationHelper.getCityNameFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (city == null) {
      emit(SelectLocationFailure(message: "Could not get city name"));
      return;
    }
    final matchedCity = AppConstants.egyptCities.firstWhere(
      (element) => element.toLowerCase().startsWith(city.toLowerCase()),
      orElse: () => 'Unknown City',
    );

    selectedLocation = matchedCity;
    filterItems();
    emit(SelectLocationSuccess());
  }

  /// Clear all applied filters
  void clearFilters() {
    selectedCategoryIndex = 0;
    selectedCategory = null;
    selectedLocation = null;
    selectedDate = null;
    selectedTime = null;
    filterByDate = null;
    filterByTime = null;

    // Reset the lists to all items
    filteredItems = List.from(allItems);
    searchedItems = List.from(allItems);

    emit(GetItemsSuccess());
  }
}
