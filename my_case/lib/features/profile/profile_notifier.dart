import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/data/repositories/profile_repository.dart';
import 'package:my_case/features/profile/profile_ui_model.dart';

class ProfileNotifier extends AutoDisposeAsyncNotifier<ProfileUIModel> {
  @override
  FutureOr<ProfileUIModel> build() async {
    var profileData = await ProfileRepository().getUserDetail();
    return ProfileUIModel(
      profileModel: profileData,
    );
  }
}

final profileNotifierProvider = AutoDisposeAsyncNotifierProvider<ProfileNotifier, ProfileUIModel>(
  ProfileNotifier.new,
);
