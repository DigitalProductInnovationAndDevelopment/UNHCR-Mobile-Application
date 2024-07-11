import 'dart:async';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/features/requests/create_request/models/file_model.dart';
import 'package:path_provider/path_provider.dart';

class RecordingsNotifier extends AutoDisposeAsyncNotifier<List<FileModel>> {
  @override
  FutureOr<List<FileModel>> build() async {
    final Directory directory = await getApplicationDocumentsDirectory();

    final List<FileSystemEntity> files = directory.listSync();

    final List<FileModel> recordings = files
        .where((file) => file.path.endsWith('.m4a'))
        .map(
          (file) => FileModel(
            name: file.path.split('/').last,
            path: file.path,
          ),
        )
        .toList();
    if (EasyLoading.isShow) EasyLoading.dismiss();
    return recordings;
  }

  Future<void> deleteRecording(String path) async {
    final file = File(path);
    await file.delete();
    ref.invalidateSelf();
  }
}

final recordingsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RecordingsNotifier, List<FileModel>>(
  RecordingsNotifier.new,
);
