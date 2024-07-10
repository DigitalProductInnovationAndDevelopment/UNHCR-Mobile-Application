import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/data/repositories/auth_repository.dart';

final signUpControllerProvider = Provider<SignUpController>((ref) {
  return SignUpController(ref);
});

class SignUpController {
  final Ref _ref;

  SignUpController(this._ref);

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String surname,
  }) async {
    EasyLoading.show();

    try {
      await AuthRepository().signUp(
        email: email,
        password: password,
        name: name,
        surname: surname,
      );
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
