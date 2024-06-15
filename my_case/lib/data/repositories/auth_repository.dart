import 'package:my_case/data/client/dio_client.dart';

class AuthRepository {
  static AuthRepository? _instance;

  factory AuthRepository() {
    _instance ??= AuthRepository._();
    return _instance!;
  }

  AuthRepository._();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await DioClient.instance.post(
        "/login",
        data: {
          "email": email,
          "password": password,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
