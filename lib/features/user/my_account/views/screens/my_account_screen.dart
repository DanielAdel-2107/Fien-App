import 'package:fien/core/components/custom_icon_button.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/my_account/views/widgets/my_account_screen_body.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account", style: AppTextStyles.title24BlackBold),
        leading: CustomIconButton(
          icon: Icons.arrow_back_ios_new,
          iconColor: Colors.black,
          iconSize: SizeConfig.width * 0.07,
          onPressed: () => context.popScreen(),
        ),
      ),
      body: MyAccountScreenBody(),
    );
  }
}

