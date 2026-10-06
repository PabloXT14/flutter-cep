import 'package:flutter/material.dart';
import 'package:flutter_cep/ui/home/widgets/address.dart';
import 'package:flutter_cep/ui/home/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de CEP'),
        leading: Icon(Icons.location_on),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            Header(),

            TextField(
              keyboardType: TextInputType.number,
              maxLength: 9,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'CEP',
                hintText: 'Digite o CEP (ex: 12345-678)',
                counterText: '',
              ),
            ),

            AnimatedSwitcher(
              duration: Duration.zero,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search_rounded),
                label: Text('Buscar CEP'),
              ),
            ),

            Address(),
          ],
        ),
      ),
    );
  }
}
