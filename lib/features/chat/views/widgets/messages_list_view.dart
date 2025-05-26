import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/chat/models/message_model.dart';
import 'package:fien/features/chat/view_models/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key, required this.messages});
  final List<ChatMessage> messages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return BubbleSpecialThree(
            isSender:
                messages[index].id == getIt<CacheHelper>().getUserModel()!.id,
            text:
                "${messages[index].id == getIt<CacheHelper>().getUserModel()!.id
                    ? "You\n"
                    : context.read<ChatCubit>().chatModel.finderId == getIt<CacheHelper>().getUserModel()!.id
                    ? "${context.read<ChatCubit>().chatModel.userName}\n"
                    : "${context.read<ChatCubit>().chatModel.finderName}\n"}${messages[index].message}",
            color:
                messages[index].id == getIt<CacheHelper>().getUserModel()!.id
                    ? AppColors.kPrimaryColor
                    : Colors.grey.shade300,
            tail: true,
            textStyle:
                messages[index].id == getIt<CacheHelper>().getUserModel()!.id
                    ? AppTextStyles.title18White
                    : AppTextStyles.title18PrimaryColorW500,
          );
        },
      ),
    );
  }
}
