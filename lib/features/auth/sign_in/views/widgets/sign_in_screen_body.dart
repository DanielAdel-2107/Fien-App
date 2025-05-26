import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/auth/sign_in/views/widgets/sign_in_form_fields.dart';
import 'package:fien/features/auth/sign_up/views/widgets/back_button.dart';
import 'package:fien/features/auth/sign_up/views/widgets/have_account_or_not.dart';
import 'package:fien/features/auth/sign_up/views/widgets/or_with_divider.dart';
import 'package:fien/features/auth/sign_up/views/widgets/social_sign.dart';
import 'package:flutter/material.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

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
                      "Sign In To Your Account",
                      style: AppTextStyles.title36PrimaryColorW500,
                    ),
                    SizedBox(height: SizeConfig.height * 0.017),
                    Text(
                      "Enter your email and password to log in ",
                      style: AppTextStyles.title18GreyW500,
                    ),
                    SizedBox(height: SizeConfig.height * 0.05),
                    SignInFormFields(),
                    OrWithDivider(),
                    SocialSign(),
                  ],
                ),
              ),
            ),
            HaveAccountOrNot(
              title: "Don't have an account",
              btnText: "Sign Up",
              onPressed: () => context.pushScreen(RouteNames.signUpScreen),
            ),
          ],
        ),
      ),
    );
  }
}
