import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/data/local/case_type_list.dart';
import 'package:my_case/features/requests/create_request/create_request_ui_model.dart';

class CreateRequestNotifier extends AsyncNotifier<CreateRequestUiModel> {
  @override
  FutureOr<CreateRequestUiModel> build() {
    return CreateRequestUiModel(
      selectedCategory: null,
      caseTypes: CaseTypeList.caseTypes,
      selectedCaseTypes: [],
    );
  }

  Future<void> selectCategory(String? category) async {
    await update(
      (model) => model.copyWith(
        selectedCategory: category,
      ),
    );
  }

  Future<void> toggleCaseType(String caseType) async {
    await update(
      (model) {
        final selectedCaseTypes = model.selectedCaseTypes ?? [];
        if (selectedCaseTypes.contains(caseType)) {
          selectedCaseTypes.remove(caseType);
        } else {
          selectedCaseTypes.add(caseType);
        }

        return model.copyWith(
          selectedCaseTypes: selectedCaseTypes,
        );
      },
    );
  }

  Future<void> setCaseDescription(String description) async {
    await update(
      (model) => model.copyWith(
        caseDescription: description,
      ),
    );
  }
}

final createRequestNotifierProvider =
    AsyncNotifierProvider<CreateRequestNotifier, CreateRequestUiModel>(
  CreateRequestNotifier.new,
);
