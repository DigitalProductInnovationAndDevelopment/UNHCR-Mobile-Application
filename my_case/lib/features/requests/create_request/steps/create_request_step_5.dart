import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              "Please choose the most appropriate case type for your request (multiple select possible):",
              style: context.text16,
            ),
            const SizedBox(height: 64),
            Wrap(
              children: uiModel?.caseTypes != null
                  ? uiModel?.caseTypes!
                          .map(
                            (caseType) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: FilterChip(
                                label: Text(caseType.name),
                                selected:
                                    uiModel?.selectedCaseTypes?.contains(caseType.id) ?? false,
                                onSelected: (value) {
                                  ref
                                      .read(createRequestNotifierProvider.notifier)
                                      .toggleCaseType(caseType.id);
                                },
                                selectedShadowColor: CColors.primaryColor,
                                labelStyle: TextStyle(
                                  color: uiModel?.selectedCaseTypes?.contains(caseType.id) ?? false
                                      ? Colors.white
                                      : CColors.primaryColor,
                                ),
                              ),
                            ),
                          )
                          .toList() ??
                      []
                  : [],
            ),
            const Spacer(),
            CButton(
              text: "Continue",
              verticalPadding: 12,
              onTap: () {},
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
