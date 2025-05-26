import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/auth/sign_up/views/widgets/back_button.dart';
import 'package:fien/features/auth/sign_up/views/widgets/have_account_or_not.dart';
import 'package:fien/features/auth/sign_up/views/widgets/or_with_divider.dart';
import 'package:fien/features/auth/sign_up/views/widgets/sign_up_form_fields.dart';
import 'package:fien/features/auth/sign_up/views/widgets/social_sign.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBackButton(),
            SizedBox(height: SizeConfig.height * 0.03),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your account",
                      style: AppTextStyles.title36PrimaryColorW500,
                    ),
                    SizedBox(height: SizeConfig.height * 0.02),
                    SignUpFormFields(),
                    OrWithDivider(),
                    SocialSign(),
                    HaveAccountOrNot(
                      title: "Have an account? ",
                      btnText: "Log In",
                      onPressed: () {
                        context.popScreen();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

