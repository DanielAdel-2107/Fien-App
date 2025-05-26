// ignore_for_file: deprecated_member_use

import 'package:fien/core/components/custom_icon_button.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:flutter/material.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: SizeConfig.width * 0.15,
            backgroundColor: AppColors.kPrimaryColor.withOpacity(0.2),
            child: Icon(
              Icons.person,
              color: AppColors.kPrimaryColor,
              size: SizeConfig.width * 0.18,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: SizeConfig.width * 0.04,
              backgroundColor: AppColors.kPrimaryColor,
              child: CustomIconButton(
                icon: Icons.edit,
                iconSize: SizeConfig.width * 0.04,
                onPressed: () {},
                iconColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
