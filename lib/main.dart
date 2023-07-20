import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'config/navigator/app_router.dart';

void main() {
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