import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/components/c_text_field.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_ui_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: CAppBar(
        showSteps: true,
        totalSteps: 3,
        currentStep: 1,
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
              hintText: "First Name",
              title: "First Name",
              controller: _nameController,
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Last Name",
              title: "Last Name",
              controller: _surnameController,
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Email",
              title: "Email",
              controller: _emailController,
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Password",
              title: "Password",
              isPassword: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Verify Password",
              title: "Verify Password",
              isPassword: true,
              controller: _verifyPasswordController,
            ),
            const Spacer(),
            CButton(
              text: "Continue",
              onTap: () {
                if (_passwordController.text != _verifyPasswordController.text) {
                  EasyLoading.showError("Passwords do not match");
                  return;
                }

                final email = _emailController.text;
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(email)) {
                  EasyLoading.showError("Please enter a valid email address");
                  return;
                }

                if (_nameController.text.isEmpty ||
                    _surnameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _verifyPasswordController.text.isEmpty) {
                  EasyLoading.showError("Please fill all fields");
                  return;
                }

                GoRouter.of(context).push(
                  NavigationEnums.signUpScreenStep2.routeName,
                  extra: SignUpUiModel(
                    name: _nameController.text,
                    surname: _surnameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              },
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
