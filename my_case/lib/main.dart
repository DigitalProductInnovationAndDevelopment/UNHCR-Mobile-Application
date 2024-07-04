import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/features/localization/strings.g.dart';
import 'package:my_case/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..animationStyle = EasyLoadingAnimationStyle.opacity
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.black
    ..progressColor = Colors.black
    ..textColor = Colors.white
    ..boxShadow = <BoxShadow>[]
    ..maskColor = Colors.black.withOpacity(0.7)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = true
    ..dismissOnTap = true;

  runApp(
    TranslationProvider(
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}
