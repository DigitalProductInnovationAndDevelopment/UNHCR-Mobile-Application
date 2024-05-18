import 'package:flutter/material.dart';
import 'package:my_case/features/localization/strings.g.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            LocaleSettings.setLocaleRaw("tr");
          },
          child: Text(context.t.actions.signIn),
        ),
      ),
    );
  }
}
