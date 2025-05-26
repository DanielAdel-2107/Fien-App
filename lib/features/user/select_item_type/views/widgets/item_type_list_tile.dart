import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/select_item_type/models/item_type_model.dart';
import 'package:flutter/material.dart';

class ItemTypeListTile extends StatelessWidget {
  const ItemTypeListTile({super.key, required this.itemTypeModel, this.onTap});
  final ItemTypeModel itemTypeModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.02,
        vertical: SizeConfig.height * 0.005,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      leading: Image.asset(itemTypeModel.image),
      title: Text(itemTypeModel.name, style: AppTextStyles.title20BlackW600),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
