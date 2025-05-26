import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_date.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_location.dart';
import 'package:flutter/material.dart';

class LostFoundItemLocationAndDate extends StatelessWidget {
  const LostFoundItemLocationAndDate({
    super.key,
    required this.location,
    required this.date,
  });
  final String location;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: LostFoundItemLocation(location: location)),
        SizedBox(width: SizeConfig.width * 0.025),
        Expanded(child: LostFoundItemDate(date: date)),
      ],
    );
  }
}

