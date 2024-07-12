import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/requests/create_request/create_request_notifier.dart';
import 'package:my_case/features/requests/create_request/create_request_ui_model.dart';

class CreateRequestStep5Screen extends ConsumerWidget {
  const CreateRequestStep5Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CreateRequestUiModel? uiModel;
    final createRequestProvider = ref.watch(createRequestNotifierProvider);

    createRequestProvider.when(
      data: (data) {
        uiModel = data;
      },
      error: (error, stackTrace) {},
      loading: () {},
    );

    return CScaffold(
      appBar: CAppBar(
        showSteps: true,
        currentStep: 5,
        totalSteps: 6,
        title: Text(
          "Create Request",
          style: context.text18Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              "Please add supporting documents here:",
              style: context.text16,
            ),
            const SizedBox(height: 32),
            CButton(
              text: "Add Documents",
              icon: Icons.add,
              iconPosition: AxisDirection.left,
              iconColor: CColors.black,
              color: CColors.white,
              textColor: CColors.black,
              verticalPadding: 12,
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

                if (result != null) {
                  List<File> files = result.paths.map((path) => File(path!)).toList();

                  ref
                      .read(createRequestNotifierProvider.notifier)
                      .addDocumentPaths(files.map((file) => file.path).toList());
                } else {}
              },
            ),
            const SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: uiModel?.selectedDocumentPaths?.map((path) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Icon(Icons.file_copy),
                              const SizedBox(width: 8),
                              Text(
                                path.split("/").last,
                                style: context.text14,
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  ref
                                      .read(createRequestNotifierProvider.notifier)
                                      .removeDocumentPath(path);
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList() ??
                      [],
                ),
              ),
            ),
            const SizedBox(height: 32),
            CButton(
              text: "Continue",
              verticalPadding: 12,
              onTap: () {
                GoRouter.of(context).push(NavigationEnums.createRequestScreenStep6.routeName);
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
