import 'dart:async';
import 'dart:io';

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

      //if message has a media file
      if (message.media != null) {
        //for each media, fetch the media file from the server
        for (var media in message.media!) {
          var resp = await ChatRepository().getMedia(
            messageId: message.id.toString(),
            mediaId: media["ID"],
          );

          var uiMedia = types.FileMessage(
            author: author,
            id: message.id.toString(),
            createdAt: DateTime.parse(message.createdAt ?? "").millisecondsSinceEpoch,
            name: media["ID"],
            size: 100,
            uri: "${resp.path}",
          );

          uiMessages.add(uiMedia);
        }
      }

      var uiMessage = types.TextMessage(
        text: message.textMessage ?? "",
        author: author,
        id: message.id.toString(),
        createdAt: DateTime.parse(message.createdAt ?? "").millisecondsSinceEpoch,
      );

      uiMessages.add(uiMessage);
    }

    // Future.delayed(const Duration(seconds: 2), () {
    //   ref.invalidateSelf();
    // });

    return ChatUIModel(
      user: user,
      messages: uiMessages,
    );
  }

  Future<void> sendMessage({
    required String caseId,
    required String text,
    List<File>? files,
  }) async {
    await ChatRepository().sendMessage(
      caseId: caseId,
      message: text,
      files: files,
    );

    ref.invalidateSelf();
  }
}

final chatNotifierProvider =
    AutoDisposeAsyncNotifierProvider.family<ChatNotifier, ChatUIModel, String>(ChatNotifier.new);
