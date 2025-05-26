import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fien/core/utilies/assets/svgs/app_svgs.dart';
import 'package:fien/features/user/home/views/widgets/custom_bottom_app_bar_icon_button.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static final List<String> _svgPaths = [
    AppSvgs.home,
    AppSvgs.chat,
    AppSvgs.myAds,
    AppSvgs.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: _svgPaths.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? const Color(0xFF2196F3) : Colors.grey;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: CustomBottomAppBarIconButton(
            imagePath: _svgPaths[index],
            color: color,
          ),
        );
      },
      activeIndex: currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: onTap,
      backgroundColor: Colors.white,
    );
  }
}
