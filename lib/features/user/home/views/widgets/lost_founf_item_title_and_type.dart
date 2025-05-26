import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class LostFoundItemTitleAndType extends StatelessWidget {
  const LostFoundItemTitleAndType({
    super.key,
   this.title,
    required this.type,
  });

  final String ?title;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.015,
            vertical: SizeConfig.height * 0.001,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(type, style: AppTextStyles.title12PrimaryColorW500),
        ),
        title==null
            ? const SizedBox()
            : SizedBox(width: SizeConfig.width * 0.02),
        title==null
            ? const SizedBox()
            : Expanded(
              child: Text(
                title!,
                style: AppTextStyles.title16BlackBold,
                maxLines: 1,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
              ),
            ),
      ],
    );
  }
}
