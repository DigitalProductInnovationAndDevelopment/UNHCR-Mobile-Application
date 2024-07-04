import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/features/messages/chat/chat_ui_model.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatNotifier extends AutoDisposeAsyncNotifier<ChatUIModel> {
  @override
  FutureOr<ChatUIModel> build() {
    final user = types.User(
      id: '1',
      imageUrl: "https://thispersondoesnotexist.com/",
      firstName: "John",
      lastName: "Doe",
    );

    return ChatUIModel(
      user: user,
      messages: [
        types.TextMessage(
          text:
              """Hi John! Regarding the request you submitted, we are currently working on it. Could you please provide us with more details?""",
          author: types.User(
            id: '2',
            imageUrl: "https://thispersondoesnotexist.com/",
            firstName: "Jane",
            lastName: "Doe",
          ),
          id: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      ],
    );
  }

  Future<void> sendMessage(String text) async {
    await update((p0) {
      final message = types.TextMessage(
        text: text,
        author: p0.user,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      return ChatUIModel(
        user: p0.user,
        messages: [message, ...p0.messages],
      );
    });

    //mock response

    await Future.delayed(Duration(milliseconds: 500));

    await update((p0) {
      final message = types.TextMessage(
        text: "Thank you for your message! We will get back to you soon.",
        author: types.User(
          id: '2',
          imageUrl: "https://thispersondoesnotexist.com/",
          firstName: "Jane",
          lastName: "Doe",
        ),
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      return ChatUIModel(
        user: p0.user,
        messages: [message, ...p0.messages],
      );
    });
  }
}

final chatNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ChatNotifier, ChatUIModel>(ChatNotifier.new);
