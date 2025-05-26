import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/chat/models/chat_model.dart';
import 'package:fien/features/chat/view_models/cubit/chat_cubit.dart';
import 'package:fien/features/chat/views/widgets/chat_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var chatModel = ChatModel.fromJson(arguments);
    return BlocProvider(
      create: (context) => ChatCubit(chatModel: chatModel),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: AppColors.kPrimaryColor,
              title: Text(
                context.read<ChatCubit>().chatModel.finderId ==
                        getIt<CacheHelper>().getUserModel()!.id
                    ? context.read<ChatCubit>().chatModel.userName
                    : context.read<ChatCubit>().chatModel.finderName,
                style: AppTextStyles.title24PrimaryColorW500,
              ),
            ),
            body: ChatScreenBody(chatModel: chatModel),
          );
        },
      ),
    );
  }
}
