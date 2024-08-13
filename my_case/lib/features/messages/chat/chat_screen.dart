import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/features/messages/chat/chat_notifier.dart';
import 'package:my_case/features/messages/chat/widgets/file_media_widget.dart';
import 'package:open_file/open_file.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String caseId;
  const ChatScreen({
    super.key,
    required this.caseId,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  List<File> _files = [];

  @override
  Widget build(BuildContext context) {
    final chatProvider = ref.watch(chatNotifierProvider(widget.caseId));

    return chatProvider.when(
      data: (data) => Scaffold(
        appBar: CAppBar(
          backgroundColor: CColors.grey,
        ),
        body: Chat(
          messages: data.messages,
          typingIndicatorOptions: TypingIndicatorOptions(
            typingUsers: [],
          ),
          onSendPressed: (message) async {
            await ref.read(chatNotifierProvider(widget.caseId).notifier).sendMessage(
                  caseId: widget.caseId,
                  text: message.text,
                  files: _files,
                );

            _files = [];
          },
          showUserAvatars: true,
          showUserNames: true,
          user: data.user,
          customDateHeaderText: (p0) {
            return "";
          },
          theme: DefaultChatTheme(
            backgroundColor: CColors.grey,
            primaryColor: CColors.primaryColor,
            inputBackgroundColor: CColors.primaryColor,
            sendButtonIcon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
          inputOptions: InputOptions(
            enabled: true,
            sendButtonVisibilityMode: SendButtonVisibilityMode.always,
          ),
          fileMessageBuilder: (p0, {required messageWidth}) {
            return FileMediaWidget(
              name: p0.name,
              size: p0.size,
              uri: p0.uri,
            );
          },
          onAttachmentPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowMultiple: true,
            );

            if (result != null) {
              List<File> files = result.paths.map((path) => File(path!)).toList();

              _files = files;
            }
          },
        ),
      ),
      error: (error, stackTrace) => Container(
        child: Center(
          child: Text("Error: $error"),
        ),
      ),
      loading: () => Container(),
    );
  }
}
