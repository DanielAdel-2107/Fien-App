import 'package:cool_alert/cool_alert.dart';
import 'package:fien/core/components/show_panara_info_dialog.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';
import 'package:fien/features/auth/sign_up/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormFields extends StatelessWidget {
  const SignUpFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(apiConsumer: getIt<ApiConsumer>()),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            showCoolAlert(
              title: "Loading",
              coolAlertType: CoolAlertType.loading,
            );
          }
          if (state is SignUpSuccess) {
            context.popScreen();
            context.popScreen();
            showCoolAlert(
              title: "Success",
              message: "Sign up successfully",
              coolAlertType: CoolAlertType.success,
            );
          }
          if (state is SignUpFailure) {
            context.popScreen();
            showCoolAlert(
              title: "Failure",
              message: state.message,
              coolAlertType: CoolAlertType.error,
            );
          }
          if (state is PasswordNotMatch) {
            context.popScreen();
            showCoolAlert(
              title: "Hint",
              message: state.message,
              coolAlertType: CoolAlertType.info,
            );
          }
          if (state is AcceptTermsAndPolicy) {
            context.popScreen();
            showCoolAlert(
              title: "Hint",
              message: state.message,
              coolAlertType: CoolAlertType.info,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<SignUpCubit>();
          return SignUpForm(cubit: cubit);
        },
      ),
    );
  }
}

