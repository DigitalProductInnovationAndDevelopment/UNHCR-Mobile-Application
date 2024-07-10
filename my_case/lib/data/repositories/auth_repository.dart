import 'package:my_case/data/client/dio_client.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_ui_model.dart';

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
    SignUpUiModel? signUpUiModel,
  }) async {
    try {
      final response = await DioClient.instance.post(
        "/signup",
        data: {
          "EmailAddress": signUpUiModel?.email,
          "Password": signUpUiModel?.password,
          "Name": signUpUiModel?.name,
          "Surname": signUpUiModel?.surname,
          "Gender": signUpUiModel?.gender,
          "DateOfBirth": signUpUiModel?.dateOfBirth,
          "PlaceOfBirth": signUpUiModel?.placeOfBirth,
          "PhoneNumber": signUpUiModel?.phoneNumber,
          "Address": signUpUiModel?.address,
          "CountryOfAsylum": signUpUiModel?.countryOfAssylum,
          "Nationality": signUpUiModel?.nationality,
          "ProvinceOfResidence": signUpUiModel?.provinceOfResidence,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
