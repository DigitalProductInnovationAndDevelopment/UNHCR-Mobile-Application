import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/data/client/dio_client.dart';
import 'package:my_case/data/remote/case/case_type_model.dart';
import 'package:my_case/data/remote/case/special_need_model.dart';
import 'package:my_case/features/requests/create_request/create_request_ui_model.dart';
import 'package:my_case/features/requests/requests_notifier.dart';
import 'package:path_provider/path_provider.dart';

class CreateRequestNotifier extends AutoDisposeAsyncNotifier<CreateRequestUiModel> {
  @override
  FutureOr<CreateRequestUiModel> build() async {
    var caseCreateResp = await DioClient.instance.get("/cases");

    var caseCreate = caseCreateResp["case_create"];

    var caseTypes = List<CaseTypeModel>.from(
      caseCreate["case_types"].entries.map(
            (entry) => CaseTypeModel(
              id: entry.value.toString(),
              name: entry.key,
            ),
          ),
    );

    var psnTypes = List<SpecialNeedModel>.from(
      caseCreate["psn_types"].entries.map(
            (entry) => SpecialNeedModel(
              id: entry.value.toString(),
              name: entry.key,
            ),
          ),
    );

    return CreateRequestUiModel(
      selectedCategory: null,
      caseTypes: caseTypes,
      selectedCaseTypes: [],
      specialNeeds: psnTypes,
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
      var formData = FormData.fromMap({
        "Coverage": previousState.selectedCategory,
        //TODO: fix
        "Description": previousState.caseDescription?.isEmpty ?? false
            ? "."
            : previousState.caseDescription ?? ".",
        "CaseTypes": previousState.selectedCaseTypes,
        "PsnTypes": previousState.selectedSpecialNeeds ?? [],
        "File": [
          for (var path in previousState.selectedDocumentPaths ?? [])
            await MultipartFile.fromFile(path),
        ],
        "VoiceRecording": [
          for (var path in previousState.recodingPaths ?? []) await MultipartFile.fromFile(path),
        ],
      });

      try {
        await DioClient.instance.post(
          "/cases",
          data: formData,
        );
      } catch (e) {}

      var tempDir = await getTemporaryDirectory();
      tempDir.listSync().forEach((element) {
        if (element is File && element.uri.path.contains(".m4a")) element.deleteSync();
      });

      ref.invalidate(requestsNotifierProvider);
      ref.invalidateSelf();

      EasyLoading.showSuccess(
        "Request submitted successfully",
        duration: const Duration(seconds: 1),
      );
    } catch (e) {
      EasyLoading.showError(
        "Failed to submit request. Please try again",
        duration: const Duration(seconds: 3),
      );
    }
  }
}

final createRequestNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CreateRequestNotifier, CreateRequestUiModel>(
  CreateRequestNotifier.new,
);
