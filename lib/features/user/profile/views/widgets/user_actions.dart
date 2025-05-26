import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/profile/views/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';

class UserActions extends StatelessWidget {
  const UserActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.005,
        ),
        children: [
          ProfileListTile(
            title: "My Account",
            enableTrailing: true,
            onTap: () {
              context.pushScreen(RouteNames.myAccountScreen);
            },
          ),
          ProfileListTile(title: "My Ads", enableTrailing: true),
          ProfileListTile(title: "Chat With Us", enableTrailing: true),
          ProfileListTile(title: "Help & Support", enableTrailing: true),
          ProfileListTile(title: "About FIEN", enableTrailing: true),
          ProfileListTile(
            title: "Log Out",
            icon: Icons.logout,
            onTap: () {
              context.pushAndRemoveUntilScreen(RouteNames.signInScreen);
            },
          ),
          ProfileListTile(
            title: "Delete Account",
            style: AppTextStyles.title18Black.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
