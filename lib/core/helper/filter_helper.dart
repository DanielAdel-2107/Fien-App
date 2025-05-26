import 'dart:developer';

import 'package:fien/core/constants/app_constants.dart';
import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:flutter/material.dart';

List<LostFoundItemModel> filterItemsHelper({
  required List<LostFoundItemModel> items,
  required int selectedIndex,
  String? selectedCategory,
  String? selectedLocation,
  DateTime? filterByDate,
  TimeOfDay? filterByTime,
}) {
  final statusFilter = AppConstants.itemTypes[selectedIndex].toLowerCase();
  final lowerCategory = selectedCategory?.trim().toLowerCase();

  return items.where((item) {
    log('filterByDate: ${item.dateTime }, filterByTime: $filterByTime');
    final itemDate = DateTime(item.dateTime.year, item.dateTime.month, item.dateTime.day);

    final matchDate = filterByDate == null ||
        itemDate == DateTime(filterByDate.year, filterByDate.month, filterByDate.day);

    final matchTime = filterByTime == null ||
        (item.dateTime.hour == filterByTime.hour && item.dateTime.minute == filterByTime.minute);

    final matchStatus = (statusFilter == 'all') ||
        (item.status.toLowerCase() == statusFilter);

    final matchCategory = lowerCategory == null ||
        item.itemType.name.trim().toLowerCase() == lowerCategory;

    final matchLocation = selectedLocation == null ||
        item.locationDescription.toLowerCase() == selectedLocation.toLowerCase();

    return matchStatus && matchCategory && matchLocation && matchDate && matchTime;
  }).toList();
}
