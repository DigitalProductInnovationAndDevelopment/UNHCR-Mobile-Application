import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatUIModel {
  final types.User user;
  final List<types.Message> messages;

  ChatUIModel({
    required this.user,
    required this.messages,
  });
}
