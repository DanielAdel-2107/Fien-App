import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    this.icon,
    required this.title,
    this.enableTrailing,
    this.style, this.onTap,
  });
  final IconData? icon;
  final String title;
  final bool? enableTrailing;
  final TextStyle? style;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.02,
            vertical: SizeConfig.height * 0.000,
          ),
          leading: icon != null ? Icon(icon) : null,
          title: Text(title, style: style ?? AppTextStyles.title20BlackBold),
          trailing:
              enableTrailing == true
                  ? const Icon(Icons.arrow_forward_ios)
                  : null,
        ),
        Divider(),
      ],
    );
  }
}
