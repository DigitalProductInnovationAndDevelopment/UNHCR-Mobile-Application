import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/components/c_text_field.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/requests/create_request/create_request_notifier.dart';
import 'package:my_case/features/requests/create_request/create_request_ui_model.dart';
import 'package:my_case/features/requests/create_request/models/file_model.dart';
import 'package:my_case/features/requests/create_request/recordings_notifier.dart';
import 'package:my_case/features/requests/create_request/widgets/record_button.dart';
import 'package:my_case/features/requests/create_request/widgets/recording_listener_bottom_sheet.dart';

class CreateRequestStep3Screen extends ConsumerStatefulWidget {
  const CreateRequestStep3Screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateRequestStep3ScreenState();
}

class _CreateRequestStep3ScreenState extends ConsumerState<CreateRequestStep3Screen> {
  CreateRequestUiModel? uiModel;
  List<FileModel> recordings = [];
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final createRequestProvider = ref.watch(createRequestNotifierProvider);
    final recordingsProvider = ref.watch(recordingsNotifierProvider);

    createRequestProvider.when(
      data: (data) {
        uiModel = data;
      },
      error: (error, stackTrace) {},
      loading: () {},
    );

    recordingsProvider.when(
      data: (data) {
        recordings = data;
      },
      error: (error, stackTrace) {},
      loading: () {},
    );

    return CScaffold(
      appBar: CAppBar(
        showSteps: true,
        currentStep: 3,
        totalSteps: 6,
        title: Text(
          "Create Request",
          style: context.text18Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              "Please choose the most appropriate case type for your request (multiple select possible):",
              style: context.text16,
            ),
            const SizedBox(height: 8),
            CTextField(
              controller: descriptionController,
              maxLines: 5,
              hintText: "Describe your request",
              title: "Description",
            ),
            const SizedBox(height: 8),
            RecordButton(),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recordings
                    .map(
                      (recording) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(recording.name),
                          onDeleted: () {
                            ref
                                .read(recordingsNotifierProvider.notifier)
                                .deleteRecording(recording.path);
                          },
                          onSelected: (value) {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return RecordingListenerBottomSheet(
                                  recordingPath: recording.path,
                                );
                              },
                            );
                          },
                          selected: true,
                          selectedShadowColor: CColors.primaryColor,
                          deleteIcon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          showCheckmark: false,
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Spacer(),
            CButton(
              text: "Continue",
              verticalPadding: 12,
              disabledColor: CColors.primaryColor.withOpacity(0.5),
              onTap: () async {
                if (descriptionController.text.isEmpty) {
                  EasyLoading.showError("Please enter a description");
                  return;
                }
                await ref
                    .read(createRequestNotifierProvider.notifier)
                    .setCaseDescription(descriptionController.text);

                await ref
                    .read(createRequestNotifierProvider.notifier)
                    .addRecordingPaths(recordings.map((recording) => recording.path).toList());

                if (descriptionController.text.isEmpty) {
                  EasyLoading.showError("Please enter a description");
                  return;
                }

                GoRouter.of(context).push(NavigationEnums.createRequestScreenStep4.routeName);
              },
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
