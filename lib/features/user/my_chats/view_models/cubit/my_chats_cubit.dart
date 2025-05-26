import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/features/user/my_chats/models/my_chat_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'my_chats_state.dart';

class MyChatsCubit extends Cubit<MyChatsState> {
  MyChatsCubit() : super(MyChatsLoading()) {
    getMyChats();
  }

  List<MyChatModel> myChats = [];
  List<MyChatModel> myOwnChats = [];
  List<MyChatModel> finderChats = [];

  Future<void> getMyChats() async {
    emit(MyChatsLoading());
    try {
      final userId = getIt<CacheHelper>().getUserModel()!.id;
      final response = await getIt<SupabaseClient>().from("chats").select();
      myChats = (response as List).map((e) => MyChatModel.fromJson(e)).toList();
      myOwnChats.clear();
      finderChats.clear();

      for (var chat in myChats) {
        if (chat.finderId == userId) {
          finderChats.add(chat);
        }
        if (chat.userId == userId) {
          myOwnChats.add(chat);
        }
      }
      emit(MyChatsSuccess());
    } catch (e) {
      emit(MyChatsFailed(message: e.toString()));
    }
  }
}
