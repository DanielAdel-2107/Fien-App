import 'package:fien/core/components/custom_drop_down_button_form_field.dart';
import 'package:fien/core/components/custom_elevated_button.dart';
import 'package:fien/core/components/custom_text_form_field_with_title.dart';
import 'package:fien/core/constants/app_constants.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/add_post_details/view_models/cubit/add_post_cubit.dart';
import 'package:fien/features/user/add_post_details/views/widgets/date_time_picker_section.dart';
import 'package:fien/features/user/add_post_details/views/widgets/divider_with_space.dart';
import 'package:fien/features/user/select_item_type/models/item_type_model.dart';
import 'package:fien/features/user/select_upload_image_type/views/widgets/select_image_with_gallery.dart';
import 'package:flutter/material.dart';

class AddPostFields extends StatelessWidget {
  const AddPostFields({
    super.key,
    required this.cubit,
    required this.itemType,
    this.isLoading,
  });

  final AddPostCubit cubit;
  final ItemTypeModel itemType;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.04,
        vertical: SizeConfig.height * 0.02,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Category *', style: AppTextStyles.title20Black87W500),
              SizedBox(height: SizeConfig.height * 0.01),
              Row(
                children: [
                  Image.asset(itemType.image, width: 30, height: 30),
                  SizedBox(width: SizeConfig.width * 0.02),
                  Text(
                    itemType.name,
                    style: AppTextStyles.title20PrimaryColorW500,
                  ),
                ],
              ),
              DividerWithSpace(),
              SelectImageWithGallery(
                onTap: cubit.pickImageUseGallery,
                image: cubit.selectedImage,
              ),
              DividerWithSpace(),
              CustomTextFormFieldWithTitle(
                hintText: "Enter title",
                title: "Ad Title *",
                controller: cubit.titleController,
              ),
              SizedBox(height: SizeConfig.height * 0.008),
              CustomTextFormFieldWithTitle(
                hintText: "Describe the item",
                title: "Description *",
                controller: cubit.descriptionController,
                maxLines: 3,
              ),
              SizedBox(height: SizeConfig.height * 0.008),
              CustomDropDownButtonFormField(
                title: "Location *",
                userRoles: AppConstants.egyptCities,
                hintText: "Choose Location",
                controller: cubit.locationController,
              ),
              SizedBox(height: SizeConfig.height * 0.008),
              Text('Date & Time *', style: AppTextStyles.title20Black87W500),
              SizedBox(height: SizeConfig.height * 0.01),
              DateTimePickerSection(cubit: cubit),
              SizedBox(height: SizeConfig.height * 0.05),
              isLoading == true
                  ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ),
                  )
                  : CustomElevatedButton(
                    name: "Post Ad",
                    onPressed: () {
                      cubit.addPost();
                    },
                    width: double.infinity,
                    backgroundColor: AppColors.kPrimaryColor,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
