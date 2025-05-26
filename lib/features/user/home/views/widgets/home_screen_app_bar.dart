import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImages.title, width: SizeConfig.width * 0.3),
        Container(
          width: SizeConfig.width * 0.1,
          padding: EdgeInsets.all(SizeConfig.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(
            Icons.notifications,
            color: AppColors.kPrimaryColor,
            size: SizeConfig.width * 0.08,
          ),
        ),
      ],
    );
  }
}