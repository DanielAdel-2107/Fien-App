import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class LostFoundItemType extends StatelessWidget {
  const LostFoundItemType({super.key, required this.itemType});
  final String itemType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Item Category", style: AppTextStyles.title20BlackBold),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.001,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.kPrimaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(itemType, style: AppTextStyles.title20PrimaryColorW500),
          ),
        ],
      ),
    );
  }
}
