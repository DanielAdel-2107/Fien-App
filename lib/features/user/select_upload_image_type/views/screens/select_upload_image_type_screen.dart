import 'package:fien/features/user/select_upload_image_type/views/widgets/select_upload_image_type_screen_body.dart';
import 'package:fien/features/user/upload_image/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SelectUploadImageTypeScreen extends StatelessWidget {
  const SelectUploadImageTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Upload Image"),
      body: SelectUploadImageTypeScreenBody(),
    );
  }
}






