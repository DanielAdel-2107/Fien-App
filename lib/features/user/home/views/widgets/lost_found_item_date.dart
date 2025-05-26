import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LostFoundItemDate extends StatelessWidget {
  const LostFoundItemDate({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.date_range,
          color: AppColors.kPrimaryColor,
          size: SizeConfig.width * 0.05,
        ),
        SizedBox(width: SizeConfig.width * 0.007),
        Expanded(
          child: Text(
            DateFormat.yMMMMEEEEd().format(
              date,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.title14Grey,
          ),
        ),
      ],
    );
  }
}

