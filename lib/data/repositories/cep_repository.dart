import 'dart:convert';

import 'package:flutter_cep/domain/models/cep_model.dart';
import 'package:http/http.dart' as http;

class CepRepository {
  static const String _baseUrl = 'https://viacep.com.br/ws';
  final http.Client client;

  CepRepository({required this.client});

  Future<CepModel> fetchCep(String cep) async {
    final cleanedCep = cep.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedCep.length != 8) {
      throw Exception('CEP inválido. Deve conter 8 dígitos.');
    }

    final url = Uri.parse('$_baseUrl/$cleanedCep/json/');

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData.containsKey('erro')) {
          throw Exception('CEP não encontrado.');
        }

        return CepModel.fromJson(jsonData);
      } else {
        throw Exception(
          'Falha ao buscar o CEP. Código de status: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Erro ao buscar o CEP: $e');
    }
  }
}
