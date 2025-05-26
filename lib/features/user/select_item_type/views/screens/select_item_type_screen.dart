import 'package:fien/features/user/select_item_type/views/widgets/select_item_type_screen_body.dart';
import 'package:fien/features/user/upload_image/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SelectItemTypeScreen extends StatelessWidget {
  const SelectItemTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: CustomAppBar(title: "What have you $args ?"),
      body: SelectItemTypeScreenBody(),
    );
  }
}


