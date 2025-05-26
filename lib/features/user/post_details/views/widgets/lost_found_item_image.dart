import 'package:fien/core/components/custom_icon_button.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/user/home/views/widgets/network_image_with_ssls.dart';
import 'package:fien/features/user/post_details/views/widgets/post_details_status.dart';
import 'package:flutter/material.dart';

class LostFoundItemImage extends StatelessWidget {
  const LostFoundItemImage({super.key, required this.image, required this.status});
  final String image;
  final String status;
  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * 0.35,
      child: Stack(
        children: [
          Positioned.fill(
            child: NetworkImageWithSSL(imageUrl: image, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * 0.03,
                vertical: SizeConfig.height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        icon: Icons.arrow_back_ios_new,
                        onPressed: () {
                          context.popScreen();
                        },
                        iconColor: Colors.black,
                        iconSize: SizeConfig.width * 0.09,
                      ),
                      CustomIconButton(
                        icon: Icons.menu,
                        onPressed: () {},
                        iconColor: Colors.black,
                        iconSize: SizeConfig.width * 0.09,
                      ),
                    ],
                  ),
                  PostDetailsStatus(
                    status: status,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

