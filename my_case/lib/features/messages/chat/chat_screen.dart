import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/features/messages/chat/chat_notifier.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatProvider = ref.watch(chatNotifierProvider);

    return chatProvider.when(
      data: (data) => Scaffold(
        appBar: CAppBar(),
        body: Chat(
          messages: data.messages,
          typingIndicatorOptions: TypingIndicatorOptions(
            typingUsers: [],
          ),
          onSendPressed: (message) async {
            await ref.read(chatNotifierProvider.notifier).sendMessage(message.text);
          },
          showUserAvatars: true,
          showUserNames: true,
          user: data.user,
          customDateHeaderText: (p0) {
            return "";
          },
          theme: DefaultChatTheme(
            backgroundColor: CColors.white,
            primaryColor: CColors.primaryColor,
            inputBackgroundColor: CColors.secondaryColor,
            sendButtonIcon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
          inputOptions: InputOptions(
            enabled: true,
            sendButtonVisibilityMode: SendButtonVisibilityMode.always,
          ),
          onAttachmentPressed: () {},
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
