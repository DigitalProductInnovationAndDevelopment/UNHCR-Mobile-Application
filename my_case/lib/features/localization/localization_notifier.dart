import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/features/localization/localization_model.dart';
import 'package:my_case/features/localization/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupportedLocales {
  static List<Map<String, String>> getSupportedLanguages() {
    var supportedLanguages = {
      'tr': 'Türkçe',
      'en': 'English',
      'arb': 'العربية',
      'de': 'Deutsch',
      'es': 'Español',
    };
    return AppLocaleUtils.supportedLocalesRaw
        .map((e) => {
              'code': e,
              'name': supportedLanguages[e] ?? '',
            })
        .toList();
  }

  static List<String> getSupportedLocales() {
    return AppLocaleUtils.supportedLocalesRaw;
  }
}

class LocalizationNotifier extends AsyncNotifier<LocalizationModel> {
  late SharedPreferences _sharedPreferences;
  @override
  FutureOr<LocalizationModel> build() async {
    var localeStream = LocaleSettings.getLocaleStream();

    localeStream.listen((locale) async {
      await update(
        (p0) => LocalizationModel(
          locale: locale.toString(),
          language: locale.languageCode,
        ),
      );
    });

    _sharedPreferences = await SharedPreferences.getInstance();

    final locale = _sharedPreferences.getString('locale') ?? 'tr';
    final language = _sharedPreferences.getString('language') ?? 'tr';

    return LocalizationModel(
      locale: locale,
      language: language,
    );
  }
}

final localizationNotifierProvider = AsyncNotifierProvider<LocalizationNotifier, LocalizationModel>(
  LocalizationNotifier.new,
);
