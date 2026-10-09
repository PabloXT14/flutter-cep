import 'package:flutter/material.dart';
import 'package:flutter_cep/data/repositories/cep_repository.dart';
import 'package:flutter_cep/domain/models/cep_model.dart';
import 'package:flutter_cep/ui/home/widgets/address.dart';
import 'package:flutter_cep/ui/home/widgets/header.dart';
import 'package:flutter_cep/ui/home/widgets/not_found.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = CepRepository(client: http.Client());
  final cepController = TextEditingController();
  final cepFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  String? errorMessage;
  CepModel? cepModel;
  bool isLoading = false;

  void resetState() {
    setState(() {
      errorMessage = null;
      cepModel = null;
      isLoading = false;
    });
  }

  Future<void> fetchCep() async {
    FocusScope.of(context).unfocus();

    resetState();

    setState(() => isLoading = true);

    final cep = cepController.text.trim();

    if (cep.isEmpty) {
      setState(() {
        errorMessage = 'CEP inválido. Deve conter 8 dígitos.';
        isLoading = false;
      });
      return;
    }

    try {
      final addressModel = await repository.fetchCep(cep);

      setState(() {
        cepModel = addressModel;
        errorMessage = null;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Erro ao buscar endereço.";
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              inputFormatters: [cepFormatter],
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
              duration: Duration(milliseconds: 300),
              child: isLoading
                  ? Container(
                      width: 200,
                      height: 58,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 12,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),

                            Text(
                              'Buscando CEP...',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ElevatedButton.icon(
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
              child: AnimatedOpacity(
                opacity: cepModel != null ? 1.0 : 0.0,
                duration: Duration(milliseconds: 1000),
                child: Address(
                  cepModel: cepModel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
