import 'package:my_case/data/remote/case/case_type_model.dart';

class CreateRequestUiModel {
  final String? selectedCategory;
  final List<CaseTypeModel>? caseTypes;
  final List<String>? selectedCaseTypes;
  final String? caseDescription;

  CreateRequestUiModel({
    this.selectedCategory,
    this.caseTypes,
    this.selectedCaseTypes,
    this.caseDescription,
  });

  CreateRequestUiModel copyWith({
    String? selectedCategory,
    List<CaseTypeModel>? caseTypes,
    List<String>? selectedCaseTypes,
    String? caseDescription,
  }) {
    return CreateRequestUiModel(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      caseTypes: caseTypes ?? this.caseTypes,
      selectedCaseTypes: selectedCaseTypes ?? this.selectedCaseTypes,
      caseDescription: caseDescription ?? this.caseDescription,
    );
  }
}
