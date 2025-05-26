import 'package:fien/features/user/add_post/views/widgets/add_post_screen_body.dart';
import 'package:fien/features/user/upload_image/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Post Ad"),
      body: AddPostScreenbody(),
    );
  }
}

