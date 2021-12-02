// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable, unused_import, unrelated_type_equality_checks, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:core';

import 'package:conversor_moedas_flutter/models/result_cripto.dart';
import 'package:http/http.dart' as http;

class ViaCriptoService {
  static Future<ResultCripto> fetchCripto(String cripto) async {
    final Uri uri =
        Uri.parse('https://www.mercadobitcoin.net/api/$cripto/ticker/');
    final response = await http.get(uri);

    return ResultCripto.fromJson(response.body);
  }
}
