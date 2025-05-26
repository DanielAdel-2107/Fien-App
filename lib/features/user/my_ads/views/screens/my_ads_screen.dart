import 'package:fien/features/user/my_ads/views/widgets/my_ads_screen_body.dart';
import 'package:fien/features/user/upload_image/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Ads"),
      body: MyAdsScreenBody(),
    );
  }
}


