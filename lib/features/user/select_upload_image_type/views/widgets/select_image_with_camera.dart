import 'package:fien/core/components/custom_out_line_button_with_image.dart';
import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/select_upload_image_type/view_models/cubit/select_upload_image_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectImageWithCamera extends StatelessWidget {
  const SelectImageWithCamera({
    super.key,
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomOutLineButtonWithImage(
      name: " Open Camera & Take Photo",
      image: AppImages.cameraImage,
      backgroundColor:
          context.read<SelectUploadImageTypeCubit>().useGallery == false
              ? AppColors.kPrimaryColor.withOpacity(0.2)
              : Colors.transparent,
      onPressed: onPressed,
      borderRadius: 32,
      textStyle: AppTextStyles.title18PrimaryColorW500,
      borderColor:
          context.read<SelectUploadImageTypeCubit>().useGallery == false
              ? AppColors.kPrimaryColor
              : null,
    );
  }
}
