import 'package:fien/features/user/my_chats/view_models/cubit/my_chats_cubit.dart';
import 'package:fien/features/user/my_chats/views/widgets/custom_tab_bar.dart';
import 'package:fien/features/user/my_chats/views/widgets/custom_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyChatsScreenBody extends StatelessWidget {
  const MyChatsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: BlocProvider(
          create: (context) => MyChatsCubit(),
          child: Column(
            children: [
              CustomTabBar(),
              CustomTabBarView(),
            ],
          ),
        ),
      ),
    );
  }
}


