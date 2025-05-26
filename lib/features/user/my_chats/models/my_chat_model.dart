import 'package:fien/features/chat/models/message_model.dart';

class MyChatModel {
  final String id;
  final String userId;
  final String finderId;
  final String userName;
  final String finderName;
  final List<ChatMessage>? messages;

  MyChatModel({
    required this.id,
     this.messages,
    required this.userId,
    required this.userName,
    required this.finderId,
    required this.finderName,
  });

  factory MyChatModel.fromJson(Map<String, dynamic> json) {
    return MyChatModel(
      id: json['id'],
      messages:
          (json['messages'] as List)
              .map((message) => ChatMessage.fromJson(message))
              .toList(),
      userId: json['user_id'],
      userName: json['user_name'],
      finderId: json['finder_id'],
      finderName: json['finder_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'user_id': userId,
      'finder_name': finderName,
      'finder_id': finderId,

      'messages': messages?.map((msg) => msg.toJson()).toList(),
    };
  }
}
