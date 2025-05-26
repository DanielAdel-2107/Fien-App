import 'dart:io';
import 'package:fien/core/components/custom_text_form_field.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/user/search/view_models/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchByImageField extends StatelessWidget {
  const SearchByImageField({super.key, this.args});

  final File? args;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Search",
      onChanged: (value) {
        context.read<SearchCubit>().searchItemsByText(value);
      },
      fillColor: Colors.white,
      suffixIcon: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.01,
          vertical: SizeConfig.height * 0.005,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child:
            args == null
                ? SizedBox()
                : Image.file(
                  File(args!.path),
                  width: SizeConfig.width * 0.15,
                  height: SizeConfig.height * 0.05,
                  fit: BoxFit.cover,
                ),
      ),
    );
  }
}
