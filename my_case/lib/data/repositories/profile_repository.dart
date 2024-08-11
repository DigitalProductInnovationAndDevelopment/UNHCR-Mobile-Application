import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_case/data/client/dio_client.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_ui_model.dart';

class ProfileRepository {
  static ProfileRepository? _instance;

  factory ProfileRepository() {
    _instance ??= ProfileRepository._();
    return _instance!;
  }

  ProfileRepository._();

  //get profile data
}
