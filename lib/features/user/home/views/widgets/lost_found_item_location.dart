import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class LostFoundItemLocation extends StatelessWidget {
  const LostFoundItemLocation({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: AppColors.kPrimaryColor,
          size: SizeConfig.width * 0.05,
        ),
        SizedBox(width: SizeConfig.width * 0.007),
        Expanded(
          child: Text(
            location,
            style: AppTextStyles.title14Grey,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
