import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/data/repositories/auth_repository.dart';
import 'package:my_case/features/view/navigation_bar_notifier.dart';

final signInControllerProvider = Provider<SignInController>((ref) {
  return SignInController(ref);
});

class SignInController {
  final Ref _ref;
  SignInController(this._ref);

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    EasyLoading.show();

    try {
      await AuthRepository().login(
        email: email,
        password: password,
      );

      _ref.read(navigationBarProvider.notifier).setIndex(0);
    } catch (e) {
      EasyLoading.showError(
        e.toString(),
        duration: const Duration(seconds: 3),
      );
      return;
    } finally {
      EasyLoading.dismiss();
    }

    GoRouter.of(context).go(NavigationEnums.viewScreen.routeName);
  }
}
