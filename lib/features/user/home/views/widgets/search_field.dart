import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/components/custom_icon_button.dart';
import 'package:fien/core/components/custom_text_form_field.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: SizeConfig.width * 0.02),
        Expanded(
          child: CustomTextFormField(
            onTap: () {
              context.pushScreen(RouteNames.searchScreen);
            },
            hintText: "Search for a lost or found item",
            prefixIcon: const Icon(Icons.search),
            suffixIcon: CustomIconButton(
              icon: Icons.camera_alt_outlined,
              iconColor: AppColors.kPrimaryColor,
              iconSize: SizeConfig.width * 0.07,
              onPressed: () {
                context.pushScreen(RouteNames.uploadImageScreen);
              },
            ),
          ),
        ),
      ],
    );
  }
}
