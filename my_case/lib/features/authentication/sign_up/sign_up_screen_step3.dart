import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/components/c_text_field.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_ui_model.dart';

class SignUpScreenStep3 extends ConsumerStatefulWidget {
  final SignUpUiModel signUpUiModel;
  const SignUpScreenStep3({
    super.key,
    required this.signUpUiModel,
  });

  @override
  ConsumerState<SignUpScreenStep3> createState() => _SignUpScreenStep2State();
}

class _SignUpScreenStep2State extends ConsumerState<SignUpScreenStep3> {
  final TextEditingController _countryOfAssylumController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: CAppBar(
        showSteps: true,
        totalSteps: 3,
        currentStep: 3,
        leading: const CLogo(
          size: 150,
          heroTag: "logo",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            CTextField(
              hintText: "Country of Assylum",
              title: "Country of Assylum",
              controller: _countryOfAssylumController,
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Nationality",
              title: "Nationality",
              controller: _nationalityController,
            ),
            const Spacer(),
            CButton(
              text: "Sign Up",
              onTap: () {},
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
