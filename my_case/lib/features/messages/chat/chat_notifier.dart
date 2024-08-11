import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/data/repositories/chat_repository.dart';
import 'package:my_case/features/messages/chat/chat_ui_model.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatNotifier extends AutoDisposeFamilyAsyncNotifier<ChatUIModel, String> {
  @override
  FutureOr<ChatUIModel> build(String caseId) async {
    final user = types.User(
      id: '1',
      imageUrl: "https://thispersondoesnotexist.com/",
      firstName: "User",
      lastName: "",
    );

    final caseWorker = types.User(
      id: '2',
      imageUrl: "https://thispersondoesnotexist.com/",
      firstName: "Case",
      lastName: "Worker",
    );

    var messages = await ChatRepository().getMessages(caseId);

    var uiMessages = <types.Message>[];
    for (var message in messages) {
      var author = message.senderRole == "Case Supporter" ? caseWorker : user;

      var uiMessage = types.TextMessage(
        text: message.textMessage ?? "",
        author: author,
        id: message.id.toString(),
        createdAt: DateTime.parse(message.createdAt ?? "").millisecondsSinceEpoch,
      );

      uiMessages.add(uiMessage);
    }

    Future.delayed(const Duration(seconds: 2), () {
      ref.invalidateSelf();
    });

    return ChatUIModel(
      user: user,
      messages: uiMessages,
    );
  }

  Future<void> sendMessage(String caseId, String text) async {
    await ChatRepository().sendMessage(caseId, text);

    ref.invalidateSelf();
  }
}

final chatNotifierProvider =
    AutoDisposeAsyncNotifierProvider.family<ChatNotifier, ChatUIModel, String>(ChatNotifier.new);
