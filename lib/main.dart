import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/theme/app_theme.dart';
import 'config/navigator/app_router.dart';

Future<void> main() async {
  // Manejo de variables de entorno con flutter_dotenv
  // Cargamos varibles configuradas en el archivo .env
  await dotenv.load(fileName: '.env');
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme()
    );
  }
}
