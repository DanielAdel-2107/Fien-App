import 'package:fien/features/user/profile/views/widgets/profile_sreen_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileScreenBody(),
      backgroundColor: Colors.white,
    );
  }
}

