import 'package:fien/core/constants/app_constants.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/user/search/view_models/cubit/search_cubit.dart';
import 'package:fien/features/user/select_item_type/views/widgets/item_type_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SearchCubit>(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.height * 0.01,
              horizontal: SizeConfig.width * 0.03,
            ),
            itemCount: AppConstants.categories.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.height * 0.01),
                  child: ItemTypeListTile(
                    onTap: () {
                      context.read<SearchCubit>().selectedCategory =
                          AppConstants.categories[index].name;
                      context.popScreen();
                    },
                    itemTypeModel: AppConstants.categories[index],
                  ),
                ),
          );
        },
      ),
    );
  }
}
