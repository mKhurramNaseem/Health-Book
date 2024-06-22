import 'package:flutter/material.dart';
import 'package:health_book/navigation/route_generator.dart';
import 'package:health_book/patient_module/home_page/view/home_page.dart';
import 'package:health_book/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTheme.primaryColor.shade900,
          primary: AppColorTheme.primaryColor.shade900,
          secondary: AppColorTheme.secondaryColor,
        ),        
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
