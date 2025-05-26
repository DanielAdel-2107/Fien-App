import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScplashScreenBody extends StatelessWidget {
  const ScplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.logoImage,
          ).animate().fade(duration: 800.ms).scale(duration: 800.ms),
    
          SizedBox(height: SizeConfig.height * 0.03),
          Text("Find Items Easily Now", style: AppTextStyles.title20WhiteBold)
              .animate()
              .fade(duration: 800.ms, delay: 600.ms)
              .scale(duration: 800.ms, delay: 600.ms),
        ],
      ),
    );
  }
}
