import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_case/data/client/dio_client.dart';
import 'package:my_case/data/remote/chat/message_model.dart';
import 'package:path_provider/path_provider.dart';

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
  }) async {
    var tempDir = await getApplicationDocumentsDirectory();
    var savePath = tempDir.path + "/$mediaId.pdf";
    if (File(savePath).existsSync()) {
      return File(savePath);
    }

    var _ = await DioClient.instance.download(
      "/messages/$messageId/message-media/$mediaId",
      savePath: tempDir.path + "/$mediaId.pdf",
      onReceiveProgress: (count, total) {
        if (total <= 0) return;
        print('percentage: ${(count / total * 100).toStringAsFixed(0)}%');
      },
    );

    return File(tempDir.path + "/$mediaId.pdf");
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
