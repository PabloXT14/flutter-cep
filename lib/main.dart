import 'package:flutter/material.dart';
import 'package:flutter_cep/core/theme/app_theme.dart';
import 'package:flutter_cep/ui/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      title: 'Consulta de CEP',
      home: const HomeScreen(),
    );
  }
}
