import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/components/custom_elevated_button.dart';
import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AddPostScreenbody extends StatelessWidget {
  const AddPostScreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.postTypeImage, height: SizeConfig.height * 0.4),
        SizedBox(height: SizeConfig.height * 0.05),
        Text("Do You", style: AppTextStyles.title28PrimaryColorW500),
        SizedBox(height: SizeConfig.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
              name: "Lost An Item?",
              height: SizeConfig.height * 0.055,
              onPressed: () {
                context.pushScreen(
                  RouteNames.selectItemTypeScreen,
                  arguments: "lost",
                );
              },
              width: SizeConfig.width * 0.3,
              backgroundColor: Colors.red,
            ),
            CustomElevatedButton(
              name: "Found An Item?",
              onPressed: () {
                context.pushScreen(
                  RouteNames.selectItemTypeScreen,
                  arguments: "found",
                );
              },
              height: SizeConfig.height * 0.055,
              width: SizeConfig.width * 0.3,
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
