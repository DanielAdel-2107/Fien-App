import 'package:fien/features/user/upload_image/views/widgets/custom_app_bar.dart';
import 'package:fien/features/user/upload_image/views/widgets/upload_image_screen_body.dart';
import 'package:flutter/material.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Upload Image"),
      body: UploadImageScreenBody(),
    );
  }
}


