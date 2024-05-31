import 'package:currnverter/src/routing/routes..dart';
import 'package:currnverter/src/themes/theme.dart';
import 'package:currnverter/src/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
     ProviderScope(
      child: CurrencyConversionApp(),
    ),
  );
}

class CurrencyConversionApp extends ConsumerStatefulWidget {
  const CurrencyConversionApp({super.key});

  @override
  ConsumerState<CurrencyConversionApp> createState() =>
      _CurrencyConversionAppState();
}

class _CurrencyConversionAppState extends ConsumerState<CurrencyConversionApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      title: 'Currency Conversion',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
