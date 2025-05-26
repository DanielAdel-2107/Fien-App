import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.maxline = 1,
    this.fillColor,
    this.onChanged,
    this.onTap,
  });
  final int maxline;
  final String hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final Color? fillColor;
  final Function(String)? onChanged;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: AppTextStyles.title18Black,
          onChanged: onChanged,
          controller: controller,
          onTap: onTap,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: AppTextStyles.title16Black54,
            contentPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.04,
              vertical: SizeConfig.height * 0.015,
            ),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
          ),
          maxLines: maxline,
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(color: Colors.grey.shade300),
    );
  }
}
