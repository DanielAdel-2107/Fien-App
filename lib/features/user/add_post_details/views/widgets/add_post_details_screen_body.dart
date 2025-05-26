import 'package:cool_alert/cool_alert.dart';
import 'package:fien/core/components/show_panara_info_dialog.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/features/user/add_post_details/view_models/cubit/add_post_cubit.dart';
import 'package:fien/features/user/add_post_details/views/widgets/add_post_fields.dart';
import 'package:fien/features/user/select_item_type/models/item_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostDetailsScreenBody extends StatelessWidget {
  const AddPostDetailsScreenBody({super.key, required this.itemType});

  final ItemTypeModel itemType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(apiConsumer: getIt<ApiConsumer>()),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {
          if (state is PickImageFailed) {
            showCoolAlert(
              title: "Failed",
              coolAlertType: CoolAlertType.error,
              message: state.message,
            );
          }
          if (state is AddPostSuccess) {
            context.popScreen();
            context.popScreen();
            context.popScreen();
            showCoolAlert(
              title: "Success",
              coolAlertType: CoolAlertType.success,
              message: "Add post successfully",
            );
          }
          if (state is AddPostError) {
            showCoolAlert(
              title: "Error",
              coolAlertType: CoolAlertType.error,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<AddPostCubit>();
          return AddPostFields(
            cubit: cubit,
            itemType: itemType,
            isLoading: state is AddPostLoading,
          );
        },
      ),
    );
  }
}
