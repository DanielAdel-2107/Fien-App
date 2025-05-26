import 'package:fien/core/components/custom_out_line_button_with_image.dart';
import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:flutter/material.dart';

class SocialSign extends StatelessWidget {
  const SocialSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOutLineButtonWithImage(
          name: "Continue With Google",
          image: AppImages.googleImage,
          onPressed: () {},
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        CustomOutLineButtonWithImage(
          name: "Continue With Facebook",
          image: AppImages.facebookImage,
          onPressed: () {},
        ),
      ],
    );
  }
}
