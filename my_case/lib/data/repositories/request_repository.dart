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
      await Future.delayed(Duration(milliseconds: 500));
      return [
        CaseModel(
          id: "CASE-2482",
          description: "HOUSEHOLD",
          status: "Open",
          date: "2024-06-02",
        ),
        CaseModel(
          id: "CASE-2483",
          description: "INDIVIDUAL",
          status: "Closed",
          date: "2024-05-14",
        ),
        CaseModel(
          id: "CASE-2484",
          description: "INDIVIDUAL",
          status: "Closed",
          date: "2024-05-10",
        ),
      ];
    } catch (e) {
      rethrow;
    }
  }
}
