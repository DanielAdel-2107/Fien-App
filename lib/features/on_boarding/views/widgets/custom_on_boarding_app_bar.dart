import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/components/custom_text_button.dart';
import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingAppBar extends StatelessWidget {
  const CustomOnBoardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImages.title),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          color: Colors.white,
          margin: EdgeInsets.zero,
          child: CustomTextButton(
            title: "Skip",
            onPressed: () {
              context.pushScreen(RouteNames.signInScreen);
            },
            alignment: Alignment.center,
            style: AppTextStyles.title18PrimaryColorW500,
          ),
        ),
      ],
    );
  }
}

