import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consulta de CEP',
      home: Scaffold(
        body: const Center(child: Text('Consulta de CEP')),
      ),
    );
  }
}
