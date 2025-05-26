import 'package:fien/core/components/custom_icon_button.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 4,
          child: CustomIconButton(
            icon: Icons.arrow_back,
            iconColor: AppColors.kPrimaryColor,
            onPressed: () => context.popScreen(),
          ),
        ),
      ],
    );
  }
}
