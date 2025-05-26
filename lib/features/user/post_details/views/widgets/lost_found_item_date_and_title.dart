import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class LostFoundItemDateAndTitle extends StatelessWidget {
  const LostFoundItemDateAndTitle({
    super.key,
    required this.date,
    required this.title,
  });
  final String date;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(date, style: AppTextStyles.title14Grey),
        Text(title, style: AppTextStyles.title24BlackBold),
      ],
    );
  }
}
