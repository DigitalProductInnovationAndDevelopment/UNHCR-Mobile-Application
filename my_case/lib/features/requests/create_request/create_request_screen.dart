import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';

class CreateRequestScreen extends ConsumerWidget {
  const CreateRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                value: 0,
                groupValue: {},
                onChanged: (value) {},
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
                value: 1,
                groupValue: {},
                onChanged: (value) {},
              ),
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
