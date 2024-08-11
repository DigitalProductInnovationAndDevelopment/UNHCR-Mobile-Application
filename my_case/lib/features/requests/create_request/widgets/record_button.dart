import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/features/requests/create_request/recordings_notifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

final recordProvider = Provider<AudioRecorder>((ref) => AudioRecorder());

class RecordButton extends ConsumerStatefulWidget {
  const RecordButton({super.key});

  @override
  ConsumerState<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends ConsumerState<RecordButton> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final record = ref.read(recordProvider);

        if (_isRecording) {
          setState(() {
            _isRecording = false;
          });
          EasyLoading.show();
          await record.stop();
          ref.invalidate(recordingsNotifierProvider);
          return;
        }

        if (await record.hasPermission()) {
          final Directory directory = await getApplicationDocumentsDirectory();
          final randomNum = DateTime.now().millisecondsSinceEpoch;
          final fullPath = '${directory.path}/recording${randomNum}.m4a';
          print(fullPath);
          await record.start(
              RecordConfig(
                encoder: Platform.isIOS ? AudioEncoder.pcm16bits : AudioEncoder.aacLc,
              ),
              path: fullPath);
          setState(() {
            _isRecording = true;
          });
          return;
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: CColors.primaryColor, width: 2),
          ),
        ),
      ),
      icon: Icon(
        _isRecording ? Icons.stop : Icons.mic,
        color: CColors.primaryColor,
        size: 48,
      ),
    );
  }
}
