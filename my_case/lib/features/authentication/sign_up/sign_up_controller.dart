import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/data/repositories/auth_repository.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_ui_model.dart';

final signUpControllerProvider = Provider<SignUpController>((ref) {
  return SignUpController(ref);
});

class SignUpController {
  final Ref _ref;

  SignUpController(this._ref);

  Future<void> signUp({
    required BuildContext context,
    required SignUpUiModel signUpUiModel,
  }) async {
    EasyLoading.show();

    try {
      await AuthRepository().signUp(
        signUpUiModel: signUpUiModel,
      );

      EasyLoading.showSuccess(
        "Sign up successful",
        duration: const Duration(seconds: 1),
      );

      GoRouter.of(context).go(NavigationEnums.signInScreen.routeName);
    } catch (e) {
      EasyLoading.showError(
        e.toString(),
        duration: const Duration(seconds: 3),
      );
      return;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
