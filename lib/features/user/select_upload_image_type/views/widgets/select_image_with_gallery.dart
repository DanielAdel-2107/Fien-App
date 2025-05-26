import 'dart:io';

import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SelectImageWithGallery extends StatelessWidget {
  const SelectImageWithGallery({
    super.key,
    required this.onTap,
    this.useGallery,
    this.image,
  });

  final Function()? onTap;
  final bool? useGallery;
  final File? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          image:
              image != null
                  ? DecorationImage(image: FileImage(image!))
                  : null,
          border: Border.all(
            color:
                useGallery == true
                    ? AppColors.kPrimaryColor
                    : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        child:image != null ? null : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: SizeConfig.width * 0.1,
              color: Colors.grey,
            ),
            SizedBox(height: SizeConfig.height * 0.005),
            Text("Select Image", style: AppTextStyles.title18GreyW500),
          ],
        ),
      ),
    );
  }
}
