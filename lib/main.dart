import 'package:flutter/material.dart';
import 'package:flutter_cep/core/theme/app_theme.dart';

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
      themeMode: ThemeMode.system,
      title: 'Consulta de CEP',
      home: Scaffold(
        body: const Center(child: Text('Consulta de CEP')),
      ),
    );
  }
}
