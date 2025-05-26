import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/my_chats/view_models/cubit/my_chats_cubit.dart';
import 'package:fien/features/user/my_chats/views/widgets/found_chat_list.dart';
import 'package:fien/features/user/my_chats/views/widgets/lost_chat_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MyChatsCubit, MyChatsState>(
        builder: (context, state) {
          if (state is MyChatsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.kPrimaryColor,
              ),
            );
          }
          if (state is MyChatsFailed) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.title24PrimaryColorW500,
              ),
            );
          }
          var cubit = context.read<MyChatsCubit>();
          return TabBarView(
            children: [
              FoundChatsList(myChats: cubit.myOwnChats),
              LostChatsList(myChats: cubit.finderChats),
            ],
          );
        },
      ),
    );
  }
}


