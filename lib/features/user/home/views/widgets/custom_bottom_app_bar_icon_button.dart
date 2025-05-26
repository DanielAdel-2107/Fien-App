import 'dart:ui';

import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomAppBarIconButton extends StatelessWidget {
  const CustomBottomAppBarIconButton({
    super.key,
    required this.imagePath,
    this.onTap,
    this.color,
  });

  final String imagePath;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        imagePath,
        width: SizeConfig.width * 0.06,
        colorFilter: ColorFilter.mode(
          color ?? AppColors.kPrimaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
