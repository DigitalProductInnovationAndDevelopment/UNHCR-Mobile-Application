import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/components/c_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: const CAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CLogo(
              size: 150,
              heroTag: "logo",
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "First Name",
              title: "First Name",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Last Name",
              title: "Last Name",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Email",
              title: "Email",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Password",
              title: "Password",
              isPassword: true,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Verify Password",
              title: "Verify Password",
              isPassword: true,
              controller: TextEditingController(),
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
