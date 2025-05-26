import 'package:cool_alert/cool_alert.dart';
import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/components/custom_elevated_button.dart';
import 'package:fien/core/components/show_panara_info_dialog.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/auth/sign_up/views/widgets/or_with_divider.dart';
import 'package:fien/features/user/select_upload_image_type/view_models/cubit/select_upload_image_type_cubit.dart';
import 'package:fien/features/user/select_upload_image_type/views/widgets/select_image_with_camera.dart';
import 'package:fien/features/user/select_upload_image_type/views/widgets/select_image_with_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectUploadImageTypeScreenBody extends StatelessWidget {
  const SelectUploadImageTypeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.03),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => SelectUploadImageTypeCubit(),
          child: BlocConsumer<
            SelectUploadImageTypeCubit,
            SelectUploadImageTypeState
          >(
            listener: (context, state) {
              if (state is SelectUploadImageType) {
                showCoolAlert(
                  title: "Hint",
                  coolAlertType: CoolAlertType.info,
                  message: "Please select image type",
                );
              }
              if (state is UploadImageSuccess) {
                context.popScreen();
                context.pushReplacementScreen(
                  RouteNames.searchScreen,
                  arguments: state.image,
                );
              }
              if (state is UploadImageFailure) {
                showCoolAlert(
                  title: "Failure",
                  coolAlertType: CoolAlertType.error,
                  message: "You Don't upload image",
                );
              }
            },
            builder: (context, state) {
              var cubit = context.read<SelectUploadImageTypeCubit>();
              return Column(
                children: [
                  SizedBox(height: SizeConfig.height * 0.05),
                  SelectImageWithGallery(
                    onTap: () {
                      cubit.selectType(value: true);
                    },
                    useGallery:
                        context.read<SelectUploadImageTypeCubit>().useGallery,
                  ),
                  SizedBox(height: SizeConfig.height * 0.05),
                  OrWithDivider(),
                  SizedBox(height: SizeConfig.height * 0.05),
                  SelectImageWithCamera(
                    onPressed: () {
                      cubit.selectType(value: false);
                    },
                  ),
                  SizedBox(height: SizeConfig.height * 0.25),
                  CustomElevatedButton(
                    name: "Continue",
                    onPressed: () {
                      cubit.pickImageForSearch();
                    },
                    backgroundColor: AppColors.kPrimaryColor,
                    width: SizeConfig.width * 0.9,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
