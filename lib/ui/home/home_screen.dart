import 'package:flutter/material.dart';
import 'package:flutter_cep/data/repositories/cep_repository.dart';
import 'package:flutter_cep/domain/models/cep_model.dart';
import 'package:flutter_cep/ui/home/widgets/address.dart';
import 'package:flutter_cep/ui/home/widgets/header.dart';
import 'package:flutter_cep/ui/home/widgets/not_found.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = CepRepository(client: http.Client());
  final cepController = TextEditingController();
  String? errorMessage;
  CepModel? cepModel;

  void resetState() {
    setState(() {
      errorMessage = null;
      cepModel = null;
    });
  }

  Future<void> fetchCep() async {
    resetState();

    final cep = cepController.text.trim();

    if (cep.isEmpty) {
      setState(() => errorMessage = 'CEP inválido. Deve conter 8 dígitos.');
      return;
    }

    try {
      final addressModel = await repository.fetchCep(cep);

      setState(() {
        cepModel = addressModel;
        errorMessage = null;
      });
    } catch (e) {
      setState(() => errorMessage = "Erro ao buscar endereço.");
    }
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

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
              controller: cepController,
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
                onPressed: fetchCep,
                icon: Icon(Icons.search_rounded),
                label: Text('Buscar CEP'),
              ),
            ),

            Visibility(
              visible: errorMessage != null,
              child: NotFound(
                errorMessage: errorMessage ?? '',
              ),
            ),

            Visibility(
              visible: cepModel != null,
              child: Address(
                cepModel: cepModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
