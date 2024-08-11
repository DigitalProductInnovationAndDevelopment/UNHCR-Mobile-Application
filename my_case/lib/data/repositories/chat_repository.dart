import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_case/data/client/dio_client.dart';
import 'package:my_case/data/remote/chat/message_model.dart';

class ChatRepository {
  static ChatRepository? _instance;

  factory ChatRepository() {
    _instance ??= ChatRepository._();
    return _instance!;
  }

  ChatRepository._();

  Future<List<MessageModel>> getMessages(String caseId) async {
    try {
      var resp = await DioClient.instance.get("/cases/$caseId/messages");
      var data = resp["data"];
      return List<MessageModel>.from(data.map((x) => MessageModel.fromJson(x)));
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getMedia({
    required String messageId,
    required String mediaId,
  }) {
    var resp = DioClient.instance.get(
      "/messages/$messageId/message-media/$mediaId",
      responseType: ResponseType.stream,
    );

    return resp;
  }

  Future<void> sendMessage({
    required String caseId,
    required String message,
    List<File>? files,
  }) async {
    try {
      var formData = FormData.fromMap({
        "TextMessage": message,
        "File": files != null
            ? files
                .map(
                  (file) => MultipartFile.fromFileSync(
                    file.path,
                    filename: file.path.split("/").last,
                  ),
                )
                .toList()
            : [],
        "VoiceRecording": [],
      });

      await DioClient.instance.post(
        "/cases/$caseId/messages",
        data: formData,
      );
    } catch (e) {
      rethrow;
    }
  }
}
