import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/features/localization/strings.g.dart';
import 'package:my_case/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    TranslationProvider(
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}
