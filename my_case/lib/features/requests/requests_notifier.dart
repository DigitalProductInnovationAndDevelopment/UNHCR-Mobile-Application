import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/data/repositories/request_repository.dart';
import 'package:my_case/features/requests/requests_ui_model.dart';

class RequestsNotifier extends AutoDisposeAsyncNotifier<RequestsUiModel> {
  @override
  FutureOr<RequestsUiModel> build() async {
    var cases = await RequestRepository().getCases();

    return RequestsUiModel(
      cases: cases,
    );
  }
}

final requestsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RequestsNotifier, RequestsUiModel>(
  RequestsNotifier.new,
);
