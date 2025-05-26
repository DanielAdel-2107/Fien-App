import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/constants/app_constants.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/user/select_item_type/views/widgets/item_type_list_tile.dart';
import 'package:flutter/material.dart';

class SelectItemTypeScreenBody extends StatelessWidget {
  const SelectItemTypeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemTypeModel: AppConstants.categories[index],
              onTap: () {
                context.pushScreen(
                  RouteNames.addPostDetailsScreen,
                  arguments: AppConstants.categories[index].toJson(),
                );
              },
            ),
          ),
    );
  }
}
