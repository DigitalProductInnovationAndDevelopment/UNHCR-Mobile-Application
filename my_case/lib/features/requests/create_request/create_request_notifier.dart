import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/data/client/dio_client.dart';
import 'package:my_case/data/local/case_type_list.dart';
import 'package:my_case/data/local/special_needs_list.dart';
import 'package:my_case/features/requests/create_request/create_request_ui_model.dart';

class CreateRequestNotifier extends AsyncNotifier<CreateRequestUiModel> {
  @override
  FutureOr<CreateRequestUiModel> build() async {
    var caseCreateResp = await DioClient.instance.get("/cases");

    var caseCreate = caseCreateResp["case_create"];

    // var caseTypes = List.generate();
    return CreateRequestUiModel(
      selectedCategory: null,
      caseTypes: CaseTypeList.caseTypes,
      selectedCaseTypes: [],
      specialNeeds: SpecialNeedsList.specialNeedsList,
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

  Future<void> toggleSpecialNeed(String specialNeed) async {
    await update(
      (model) {
        final selectedSpecialNeeds = model.selectedSpecialNeeds ?? [];
        if (selectedSpecialNeeds.contains(specialNeed)) {
          selectedSpecialNeeds.remove(specialNeed);
        } else {
          selectedSpecialNeeds.add(specialNeed);
        }

        return model.copyWith(
          selectedSpecialNeeds: selectedSpecialNeeds,
        );
      },
    );
  }

  Future<void> addDocumentPaths(List<String> documentPaths) async {
    await update(
      (model) {
        final selectedDocumentPaths = model.selectedDocumentPaths ?? [];
        selectedDocumentPaths.addAll(documentPaths);

        return model.copyWith(
          selectedDocumentPaths: selectedDocumentPaths,
        );
      },
    );
  }

  Future<void> removeDocumentPath(String documentPath) async {
    await update(
      (model) {
        final selectedDocumentPaths = model.selectedDocumentPaths ?? [];
        selectedDocumentPaths.remove(documentPath);

        return model.copyWith(
          selectedDocumentPaths: selectedDocumentPaths,
        );
      },
    );
  }

  Future<void> addRecordingPaths(List<String> recordingPaths) async {
    await update(
      (model) {
        final recodingPaths = model.recodingPaths ?? [];
        recodingPaths.addAll(recordingPaths);

        return model.copyWith(
          recodingPaths: recodingPaths,
        );
      },
    );
  }

  Future<void> removeRecordingPath(String recordingPath) async {
    await update(
      (model) {
        final recodingPaths = model.recodingPaths ?? [];
        recodingPaths.remove(recordingPath);

        return model.copyWith(
          recodingPaths: recodingPaths,
        );
      },
    );
  }

  Future<void> submitRequest() async {
    var previousState = state.asData?.valueOrNull;
    if (previousState == null) return;

    try {
      await DioClient.instance.post(
        "/cases",
        data: {
          "Coverage": previousState.selectedCategory,
          "Description": previousState.caseDescription,
          "CaseTypes": [],
          "PsnTypes": [],
        },
      );
    } catch (e) {}
  }
}

final createRequestNotifierProvider =
    AsyncNotifierProvider<CreateRequestNotifier, CreateRequestUiModel>(
  CreateRequestNotifier.new,
);
