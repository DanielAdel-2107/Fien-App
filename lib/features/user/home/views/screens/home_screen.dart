import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/home/views/widgets/add_post_button.dart';
import 'package:fien/features/user/home/views/widgets/bottom_nav_bar.dart';
import 'package:fien/features/user/home/views/widgets/home_screen_body.dart';
import 'package:fien/features/user/my_ads/views/widgets/my_ads_screen_body.dart';
import 'package:fien/features/user/my_chats/views/widgets/my_chats_screen_body.dart';
import 'package:fien/features/user/profile/views/widgets/profile_sreen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static final List<Widget> _screens = [
    const HomeScreenBody(),
    const MyChatsScreenBody(),
    const MyAdsScreenBody(),
    const ProfileScreenBody(),
  ];

  static const List<String> _appBarTitles = ["", "Chats", "My Ads", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _screens[_currentIndex],
      floatingActionButton: const AddPostButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    final title = _appBarTitles[_currentIndex];
    if (title.isEmpty) return null;

    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      title: Text(title, style: AppTextStyles.title24WhiteW500),
    );
  }
}
