import 'package:my_case/data/remote/case/case_type_model.dart';

class CaseTypeList {
  static List<CaseTypeModel> caseTypes = [
    CaseTypeModel(
      id: "health",
      name: "Health",
    ),
    CaseTypeModel(
      id: "education",
      name: "Education",
    ),
    CaseTypeModel(
      id: "food_assistance",
      name: "Food Assistance",
    ),
    CaseTypeModel(
      id: "housing",
      name: "Housing",
    ),
    CaseTypeModel(
      id: "employment",
      name: "Employment",
    ),
    CaseTypeModel(
      id: "violence_protection",
      name: "Violence Protection",
    ),
    CaseTypeModel(
      id: "other",
      name: "Other",
    ),
  ];
}
