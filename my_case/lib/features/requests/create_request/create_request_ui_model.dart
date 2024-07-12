import 'package:my_case/data/remote/case/case_type_model.dart';
import 'package:my_case/data/remote/case/special_need_model.dart';

class CreateRequestUiModel {
  final String? selectedCategory;
  final List<CaseTypeModel>? caseTypes;
  final List<String>? selectedCaseTypes;
  final String? caseDescription;
  final List<SpecialNeedModel>? specialNeeds;
  final List<String>? selectedSpecialNeeds;
  final List<String>? selectedDocumentPaths;
  final List<String>? recodingPaths;

  CreateRequestUiModel({
    this.selectedCategory,
    this.caseTypes,
    this.selectedCaseTypes,
    this.caseDescription,
    this.specialNeeds,
    this.selectedSpecialNeeds,
    this.selectedDocumentPaths,
    this.recodingPaths,
  });

  CreateRequestUiModel copyWith({
    String? selectedCategory,
    List<CaseTypeModel>? caseTypes,
    List<String>? selectedCaseTypes,
    String? caseDescription,
    List<SpecialNeedModel>? specialNeeds,
    List<String>? selectedSpecialNeeds,
    List<String>? selectedDocumentPaths,
    List<String>? recodingPaths,
  }) {
    return CreateRequestUiModel(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      caseTypes: caseTypes ?? this.caseTypes,
      selectedCaseTypes: selectedCaseTypes ?? this.selectedCaseTypes,
      caseDescription: caseDescription ?? this.caseDescription,
      specialNeeds: specialNeeds ?? this.specialNeeds,
      selectedSpecialNeeds: selectedSpecialNeeds ?? this.selectedSpecialNeeds,
      selectedDocumentPaths: selectedDocumentPaths ?? this.selectedDocumentPaths,
      recodingPaths: recodingPaths ?? this.recodingPaths,
    );
  }
}
