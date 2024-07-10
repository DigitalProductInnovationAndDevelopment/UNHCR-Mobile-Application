import 'package:my_case/data/client/dio_client.dart';

class AuthRepository {
  static AuthRepository? _instance;

  factory AuthRepository() {
    _instance ??= AuthRepository._();
    return _instance!;
  }

  AuthRepository._();

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(
        "/login",
        data: {
          "EmailAddress": email,
          "Password": password,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String name,
    required String surname,
  }) async {
    try {
      final response = await DioClient.instance.post(
        "/signup",
        data: {
          "EmailAddress": email,
          "Password": password,
          "Name": name,
          "Surname": surname,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
