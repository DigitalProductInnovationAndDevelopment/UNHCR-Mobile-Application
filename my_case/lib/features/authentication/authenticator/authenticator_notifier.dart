import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_case/features/authentication/authenticator/auth_state_enum.dart';

class AuthenticatorNotifier extends AsyncNotifier<AuthStateEnum> {
  @override
  FutureOr<AuthStateEnum> build() async {
    final secureStorage = await FlutterSecureStorage();
    final accessToken = await secureStorage.read(key: "accessToken");

    if (accessToken != null) {
      return AuthStateEnum.authenticated;
    }

    return AuthStateEnum.unauthenticated;
  }

  Future<void> logout() async {
    final secureStorage = await FlutterSecureStorage();
    await secureStorage.delete(key: "accessToken");

    state = AsyncValue.data(AuthStateEnum.unauthenticated);
  }
}

final authenticatorNotifierProvider = AsyncNotifierProvider<AuthenticatorNotifier, AuthStateEnum>(
  AuthenticatorNotifier.new,
);
