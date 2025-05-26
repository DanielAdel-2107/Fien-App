import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/home/views/widgets/location_botton_sheet.dart';
import 'package:flutter/material.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => const LocationBottomSheet(),
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: AppColors.kPrimaryColor,
            size: SizeConfig.width * 0.08,
          ),
          SizedBox(width: SizeConfig.width * 0.01),
          Text(
            "Egypt",
            style: AppTextStyles.title18Black.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: SizeConfig.width * 0.01),
          const Icon(Icons.keyboard_arrow_down_outlined),
        ],
      ),
    );
  }
}
