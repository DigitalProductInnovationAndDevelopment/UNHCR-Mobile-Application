import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

class CreateRequestScreen extends ConsumerWidget {
  const CreateRequestScreen({super.key});

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
        currentStep: 1,
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
              "Is your request an individual request or a household request?",
              style: context.text16,
            ),
            const SizedBox(height: 64),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: CColors.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RadioListTile(
                title: Text(
                  "Individual Request",
                  style: context.text16Bold.copyWith(
                    color: CColors.primaryColor,
                  ),
                ),
                value: "INDIVIDUAL",
                groupValue: uiModel?.selectedCategory,
                onChanged: (value) {
                  ref.read(createRequestNotifierProvider.notifier).selectCategory(value);
                },
                activeColor: CColors.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: CColors.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RadioListTile(
                title: Text(
                  "Household Request",
                  style: context.text16Bold.copyWith(
                    color: CColors.primaryColor,
                  ),
                ),
                value: "HOUSEHOLD",
                groupValue: uiModel?.selectedCategory,
                onChanged: (value) {
                  ref.read(createRequestNotifierProvider.notifier).selectCategory(value);
                },
                activeColor: CColors.primaryColor,
              ),
            ),
            const Spacer(),
            CButton(
              text: "Continue",
              verticalPadding: 12,
              isDisabled: uiModel?.selectedCategory == null,
              disabledColor: CColors.primaryColor.withOpacity(0.5),
              onTap: () {
                if (uiModel?.selectedCategory == null) {
                  EasyLoading.showError("Please select a category");
                  return;
                }
                GoRouter.of(context).push(NavigationEnums.createRequestScreenStep2.routeName);
              },
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
