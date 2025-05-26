import 'package:fien/features/user/categories/views/widgets/categories_screen_body.dart';
import 'package:fien/features/user/upload_image/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Categories"),
      body: CategoriesScreenBody(),
    );
  }
}

