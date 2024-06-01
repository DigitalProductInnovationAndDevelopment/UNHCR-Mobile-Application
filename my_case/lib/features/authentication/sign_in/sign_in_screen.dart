import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/components/c_text_field.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:styled_text/tags/styled_text_tag_action.dart';
import 'package:styled_text/widgets/styled_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: const CAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CLogo(
              heroTag: "logo",
            ),
            const SizedBox(height: 48),
            CTextField(
              hintText: "Email",
              title: "Email",
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            CTextField(
              hintText: "Password",
              title: "Password",
              isPassword: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 16),
            Text(
              "Forgot password?",
              style: context.text14.copyWith(
                color: CColors.primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 32),
            CButton(
              text: "Sign In",
              onTap: () {},
            ),
            const SizedBox(height: 16),
            StyledText(
              text: "Don't have an account? <primaryColor>Sign Up</primaryColor>",
              tags: {
                'primaryColor': StyledTextActionTag(
                  (text, attributes) {
                    GoRouter.of(context).push(NavigationEnums.signUpScreen.routeName);
                  },
                  style: const TextStyle(
                    color: CColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(NavigationEnums.whatIsMyCaseScreen.routeName);
              },
              child: Text(
                "What is \"MyCase\"?",
                style: context.text18.copyWith(
                  color: CColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
