import 'package:my_case/data/client/dio_client.dart';
import 'package:my_case/data/remote/profile/profile_model.dart';

class ProfileRepository {
  static ProfileRepository? _instance;

  factory ProfileRepository() {
    _instance ??= ProfileRepository._();
    return _instance!;
  }

  ProfileRepository._();

  Future<ProfileModel> getUserDetail() async {
    try {
      var resp = await DioClient.instance.get("/users");
      var data = resp["data"];
      return ProfileModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
