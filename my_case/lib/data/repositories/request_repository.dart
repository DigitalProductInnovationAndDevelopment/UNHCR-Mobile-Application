import 'package:my_case/data/client/dio_client.dart';
import 'package:my_case/data/remote/case/case_model.dart';

class RequestRepository {
  static RequestRepository? instance;

  RequestRepository._();

  factory RequestRepository() {
    instance ??= RequestRepository._();
    return instance!;
  }

  Future<List<CaseModel>> getCases() async {
    try {
      var resp = await DioClient.instance.get("/cases");
      return (resp["data"] as List).map((e) => CaseModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
