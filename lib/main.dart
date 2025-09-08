import 'package:flutter/material.dart';
import 'package:flutter_project/core/routes/app_routes.dart';
import 'package:flutter_project/core/routes/page_routes.dart';

import 'core/theme_manager/app_theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeManager.lightTheme,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}