import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:my_case/core/core_platform/router/router.dart';
import 'package:my_case/core/design_system/theme/themes.dart';
import 'package:my_case/features/localization/localization_notifier.dart';
import 'package:my_case/features/localization/strings.g.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localizationNotifierProvider);

    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.ligthTheme,
      darkTheme: CustomThemes.darkTheme,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
