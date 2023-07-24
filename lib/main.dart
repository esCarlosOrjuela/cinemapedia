import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/theme/app_theme.dart';
import 'config/navigator/app_router.dart';
import 'di_register.dart';

Future<void> main() async {
  // Manejo de variables de entorno con flutter_dotenv
  // Cargamos varibles configuradas en el archivo .env
  await dotenv.load(fileName: '.env');

  diSetup();

  /// ProviderScope => Hara referencia a todos los provider de la App usando riverpod
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: appRouter, theme: AppTheme().getTheme());
  }
}
