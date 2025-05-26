import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/user/profile/views/widgets/pick_image.dart';
import 'package:fien/features/user/profile/views/widgets/user_actions.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.height * 0.02),
            PickImage(),
            SizedBox(height: SizeConfig.height * 0.035),
            UserActions(),
          ],
        ),
      ),
    );
  }
}



