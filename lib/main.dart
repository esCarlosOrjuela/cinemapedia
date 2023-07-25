import 'package:cinemapedia/config/theme/dark/dark_theme.dart';
import 'package:cinemapedia/config/theme/light/light_theme.dart';
import 'package:cinemapedia/config/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/navigator/app_router.dart';

Future<void> main() async {
  // Manejo de variables de entorno con flutter_dotenv
  // Cargamos varibles configuradas en el archivo .env
  await dotenv.load(fileName: '.env');

  /// ProviderScope => Hara referencia a todos los provider de la App usando riverpod
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      builder: (_, themeMode, __) => MaterialApp.router(
        routerConfig: appRouter,
        theme: LightTheme.themeData,
        darkTheme: DarkTheme.themeData,
        themeMode: themeMode,
      ),
      valueListenable: ThemeManager.themeMode,
    );
  }
}
