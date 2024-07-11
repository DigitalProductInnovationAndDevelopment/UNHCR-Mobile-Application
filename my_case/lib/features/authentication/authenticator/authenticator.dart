import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/features/authentication/authenticator/auth_state_enum.dart';
import 'package:my_case/features/authentication/authenticator/authenticator_notifier.dart';
import 'package:my_case/features/authentication/sign_in/sign_in_screen.dart';
import 'package:my_case/features/view/view_screen.dart';

class Authenticator extends ConsumerWidget {
  const Authenticator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authenticatorNotifierProvider);

    return authProvider.when(
      data: (authState) {
        if (authState == AuthStateEnum.authenticated) {
          return ViewScreen();
        } else {
          return SignInScreen();
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => const Text("Error"),
    );
  }
}
