import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/components/custom_elevated_button.dart';
import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
class UploadImageScreenBody extends StatelessWidget {
  const UploadImageScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.05,
        ),
        child: Column(
          children: [
            Image.asset(
              AppImages.searchByImage,
              height: SizeConfig.height * 0.5,
            ),
            SizedBox(height: SizeConfig.height * 0.02),
            Text(
              "Try our AI-powered image reverse search to match your item with existing ads effortlessly.",
              style: AppTextStyles.title20BlackBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.height * 0.05),
            CustomElevatedButton(
              name: "Upload Image",
              onPressed: () {
                context.pushScreen(RouteNames.selectUploadImageTypeScreen);
              },
              backgroundColor: AppColors.kPrimaryColor,
              width: SizeConfig.width * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
