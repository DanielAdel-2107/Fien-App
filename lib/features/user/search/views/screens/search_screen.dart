import 'dart:io';
import 'package:fien/core/components/custom_icon_button.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/user/search/view_models/cubit/search_cubit.dart';
import 'package:fien/features/user/search/views/widgets/search_field.dart';
import 'package:fien/features/user/search/views/widgets/search_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final File? args;
  late final SearchCubit searchCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as File?;
    searchCubit = getIt<SearchCubit>();
    if (args != null) {
      searchCubit.searchByImage(selectedImage: args!);
    } else {
      searchCubit.loadFoundItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: searchCubit,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return state is GetItemsLoading
              ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              )
              : Scaffold(
                appBar: AppBar(
                  toolbarHeight: SizeConfig.height * 0.08,
                  backgroundColor: AppColors.kPrimaryColor,
                  title: SearchByImageField(args: args),
                  leading: CustomIconButton(
                    icon: Icons.arrow_back_ios_new,
                    iconColor: Colors.black,
                    onPressed: () => context.popScreen(),
                  ),
                ),
                body: SearchScreenBody(),
              );
        },
      ),
    );
  }
}
