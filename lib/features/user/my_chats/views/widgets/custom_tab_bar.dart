import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.kPrimaryColor,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyles.title20WhiteW500,
      unselectedLabelStyle: AppTextStyles.title20PrimaryColorW500,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.05,
        vertical: SizeConfig.height * 0.01,
      ),
      dividerHeight: 0,
      tabs: const [Tab(text: "Lost Items"), Tab(text: "Found Items")],
    );
  }
}
