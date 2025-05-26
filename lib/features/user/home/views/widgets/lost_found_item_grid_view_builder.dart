import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_card.dart';
import 'package:flutter/material.dart';

class LostFoundItemGridViewBuilder extends StatelessWidget {
  const LostFoundItemGridViewBuilder({super.key, required this.items});
  final List<LostFoundItemModel> items;
  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Center(
          child: Text(
            "No items found",
            style: AppTextStyles.title24PrimaryColorBold,
          ),
        )
        : GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SizeConfig.width * 0.005,
            mainAxisSpacing: SizeConfig.height * 0.005,
            childAspectRatio: SizeConfig.width / (SizeConfig.height * 0.77),
          ),
          itemBuilder: (context, index) {
            return LostFoundItemCard(
              lostFoundItemModel: items[index],
              onTap: () {
                context.pushScreen(
                  RouteNames.postDetailsScreen,
                  arguments: items[index].toJson(),
                );
              },
            );
          },
        );
  }
}
