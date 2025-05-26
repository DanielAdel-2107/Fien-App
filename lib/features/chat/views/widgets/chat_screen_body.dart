import 'package:fien/features/chat/models/chat_model.dart';
import 'package:fien/features/chat/view_models/cubit/chat_cubit.dart';
import 'package:fien/features/chat/views/widgets/messages_list_view.dart';
import 'package:fien/features/chat/views/widgets/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final cubit = context.read<ChatCubit>();
        if (state is ChatLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ChatLoaded) {
          return Column(
            children: [
              MessagesListView(messages: state.messages,),
              SendMessage(cubit: cubit),
            ],
          );
        }
        return Container();
      },
    );
  }
}

