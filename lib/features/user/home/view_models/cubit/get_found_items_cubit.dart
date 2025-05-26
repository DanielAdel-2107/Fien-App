import 'package:fien/core/constants/app_constants.dart';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/network/api/end_points.dart';
import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'get_found_items_state.dart';

class GetFoundItemsCubit extends Cubit<GetFoundItemsState> {
  final ApiConsumer apiConsumer;

  GetFoundItemsCubit({required this.apiConsumer})
    : super(GetFoundItemsInitial());

  List<LostFoundItemModel> items = [];
  List<LostFoundItemModel> foundItems = [];
  int selectedIndex = 0;
  Future<void> getFoundItems() async {
    emit(GetFoundItemsLoading());
    try {
      final response = await apiConsumer.get(EndPoints.getFoundItems);
      if (response is List) {
        items =
            response.map((item) => LostFoundItemModel.fromJson(item)).toList();
        foundItems = items;
        emit(GetFoundItemsSuccess());
      } else {
        emit(GetFoundItemsFailure(message: "Unexpected data format."));
      }
    } catch (e) {
      log(e.toString());
      emit(GetFoundItemsFailure(message: e.toString()));
    }
  }

  selectCategory(String value) {
    selectedIndex = AppConstants.itemTypes.indexOf(value);
    foundItems =
        items.where((item) {
          return item.status.toLowerCase() == value.toLowerCase() ||
              value.toLowerCase() == 'all';
        }).toList();
    emit(GetFoundItemsSuccess());
  }
}
