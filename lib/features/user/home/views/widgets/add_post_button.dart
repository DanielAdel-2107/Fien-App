import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/components/custom_icon_button.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:flutter/material.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width * 0.15,
      height: SizeConfig.height * 0.15,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: CircleAvatar(
        radius: SizeConfig.width * 0.1,
        backgroundColor: AppColors.kPrimaryColor,
        child: CustomIconButton(
          icon: Icons.add,
          onPressed: () {
            context.pushScreen(RouteNames.addPostScreen);
          },
        ),
      ),
    );
  }
}
