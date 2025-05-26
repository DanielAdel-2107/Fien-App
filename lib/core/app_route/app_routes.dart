import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/features/auth/sign_in/views/screens/sign_in_screen.dart';
import 'package:fien/features/auth/sign_up/views/screens/sign_up_screen.dart';
import 'package:fien/features/chat/views/screens/chat_screen.dart';
import 'package:fien/features/on_boarding/views/screens/on_boarding_screen.dart';
import 'package:fien/features/splash/views/screens/splash_screen.dart';
import 'package:fien/features/user/add_post/views/screens/add_post_screen.dart';
import 'package:fien/features/user/add_post_details/views/screens/add_post_details_screen.dart';
import 'package:fien/features/user/categories/views/screens/categories_screen.dart';
import 'package:fien/features/user/filter/views/screens/filter_screen.dart';
import 'package:fien/features/user/home/views/screens/home_screen.dart';
import 'package:fien/features/user/my_account/views/screens/my_account_screen.dart';
import 'package:fien/features/user/post_details/views/screens/post_details_screen.dart';
import 'package:fien/features/user/search/views/screens/search_screen.dart';
import 'package:fien/features/user/select_item_type/views/screens/select_item_type_screen.dart';
import 'package:fien/features/user/select_upload_image_type/views/screens/select_upload_image_type_screen.dart';
import 'package:fien/features/user/upload_image/views/screens/upload_image_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)>
  routes = <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.signInScreen: (context) => const SignInScreen(),
    RouteNames.signUpScreen: (context) => const SignUpScreen(),
    RouteNames.homeScreen: (context) => HomeScreen(),
    RouteNames.uploadImageScreen: (context) => const UploadImageScreen(),
    RouteNames.selectUploadImageTypeScreen:
        (context) => const SelectUploadImageTypeScreen(),
    RouteNames.searchScreen: (context) => const SearchScreen(),
    RouteNames.addPostScreen: (context) => const AddPostScreen(),
    RouteNames.selectItemTypeScreen: (context) => const SelectItemTypeScreen(),
    RouteNames.addPostDetailsScreen: (context) => const AddPostDetailsScreen(),
    RouteNames.postDetailsScreen: (context) => const PostDetailsScreen(),
    RouteNames.chatScreen: (context) => const ChatScreen(),
    RouteNames.myAccountScreen: (context) => const MyAccountScreen(),
    RouteNames.filterScreen: (context) => const FilterScreen(),
    RouteNames.categoriesScreen: (context) => const CategoriesScreen(),
    // RouteNames.profileScreen: (context) => const ProfileScreen(),
    // RouteNames.myTicketsScreen: (context) => const MyTicketsScreen(),
  };
}
