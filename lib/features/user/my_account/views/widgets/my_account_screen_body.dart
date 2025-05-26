import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/components/custom_elevated_button.dart';
import 'package:fien/core/components/custom_text_form_field_with_title.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class MyAccountScreenBody extends StatelessWidget {
  const MyAccountScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.01,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.userImage,
                  height: SizeConfig.height * 0.09,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: SizeConfig.width * 0.04),
                Expanded(
                  child: CustomTextFormFieldWithTitle(
                    hintText: getIt<CacheHelper>().getUserModel()!.username,
                    title: "User Name",
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.height * 0.02),
            CustomTextFormFieldWithTitle(
              hintText: "21/07/2002",
              title: "Date Of Birth",
            ),
            SizedBox(height: SizeConfig.height * 0.01),
            CustomTextFormFieldWithTitle(
              hintText: "${getIt<CacheHelper>().getUserModel()!.username}@gmail.com",
              title: "Email Address",
            ),
            SizedBox(height: SizeConfig.height * 0.01),
            CustomTextFormFieldWithTitle(
              hintText: "+20 1002003056",
              title: "Phone Number",
            ),
            SizedBox(height: SizeConfig.height * 0.3),
            CustomElevatedButton(
              name: "Update Profile",
              onPressed: () {},
              backgroundColor: AppColors.kPrimaryColor,
              textStyle: AppTextStyles.title20WhiteBold,
            ),
          ],
        ),
      ),
    );
  }
}
