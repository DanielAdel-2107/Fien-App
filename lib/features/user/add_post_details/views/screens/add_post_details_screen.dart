import 'package:fien/features/user/add_post_details/views/widgets/add_post_details_screen_body.dart';
import 'package:fien/features/user/select_item_type/models/item_type_model.dart';
import 'package:fien/features/user/upload_image/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddPostDetailsScreen extends StatelessWidget {
  const AddPostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var itemType = ItemTypeModel.fromJson(args);

    return Scaffold(
      appBar: CustomAppBar(title: "Ad Details"),
      body: AddPostDetailsScreenBody(itemType: itemType),
    );
  }
}

