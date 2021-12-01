// ignore_for_file: unused_import, prefer_final_fields, unused_field, prefer_const_constructors, use_key_in_widget_constructors, avoid_print, non_constant_identifier_names, unnecessary_cast, void_checks, prefer_typing_uninitialized_variables, unused_element, deprecated_member_use, sized_box_for_whitespace, unused_local_variable, unrelated_type_equality_checks, unnecessary_string_interpolations, unnecessary_null_comparison

import 'package:conversor_moedas_flutter/models/result_cripto.dart';
import 'package:conversor_moedas_flutter/services/via_cripto_service.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// --------- ÍNICIO SESSÃO DE DELCARAÇÕES --------------- //

// variaveis de calculo
double btc = 0;
double ltc = 0;
double ada = 0;
double uni = 0;
double usdc = 0;
double reais = 0;

double D_btc = 0;
double D_ltc = 0;
double D_ada = 0;
double D_uni = 0;
double D_usdc = 0;
double D_reais = 0;

// variables for request api
String? Btc_last = '';
String? Ltc_last = '';
String? Ada_last = '';
String? Uni_last = '';
String? Usdc_last = '';
String? Real_last = '';
String? S_btc = '';
String? S_ltc = '';
String? S_ada = '';
String? S_uni = '';
String? S_usdc = '';
String? S_reais = '';

// booleans
bool _erro = true;
bool _loading = false;
bool _enableField = true;

// controllers
final btcController = TextEditingController();
final ltcController = TextEditingController();
final adaController = TextEditingController();
final uniController = TextEditingController();
final usdcController = TextEditingController();
final realController = TextEditingController();

// aux para api
var resultCripto;

// --------- FIM SESSÃO DE DELCARAÇÕES --------------- //

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CONVERSOR CRIPTOO'),
        ),
        //getData(),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildTextField("Valor (R\$)", "R\$ ", realController),
                Divider(),
                buildTextField("Bitcoin", "", btcController),
                Divider(),
                buildTextField("LiteCoin", "", ltcController),
                Divider(),
                buildTextField("Cardano", "", adaController),
                Divider(),
                buildTextField("UniSwap", "", uniController),
                Divider(),
                buildTextField("UsdCoion", "", usdcController),
                // Botões
                buildSearchCriptoButton(),
                buildButtonLimparCampos(),
                Divider(),
              ],
            )));
  }
}

/////////////////////////////////////////////////////////////////////

Future getData() async {
  // Chama cripto BTC
  resultCripto = await ViaCriptoService.fetchCripto('BTC');
  Btc_last = resultCripto.ticker.last;
  print('PREÇO BTC: $Btc_last');

  // Chama cripto LTC
  resultCripto = await ViaCriptoService.fetchCripto('LTC');
  Ltc_last = resultCripto.ticker.buy;
  print('PREÇO LTC: $Ltc_last');

  // Chama cripto ADA
  resultCripto = await ViaCriptoService.fetchCripto('ADA');
  Ada_last = resultCripto.ticker.buy;
  print('PREÇO ADA: $Ada_last');

  // Chama cripto UNI
  resultCripto = await ViaCriptoService.fetchCripto('UNI');
  Uni_last = resultCripto.ticker.buy;
  print('PREÇO UNI: $Uni_last');

  // Chama cripto USDC
  resultCripto = await ViaCriptoService.fetchCripto('USDC');
  Usdc_last = resultCripto.ticker.buy;
  print('PREÇO USDC: $Usdc_last');

  S_btc = btcController.text;
  S_ltc = ltcController.text;
  S_ada = adaController.text;
  S_uni = uniController.text;
  S_usdc = usdcController.text;
  S_reais = realController.text;

  btc = double.parse('$Btc_last');
  ltc = double.parse('$Ltc_last');
  ada = double.parse('$Ada_last');
  uni = double.parse('$Uni_last');
  usdc = double.parse('$Usdc_last');

  if (S_reais!.isEmpty) {
    D_reais = 0;
  } else {
    D_reais = double.parse('$S_reais');
  }

  if (S_btc!.isEmpty) {
    D_btc = 0;
  } else {
    D_btc = double.parse('$S_btc');
  }

  if (S_ltc!.isEmpty) {
    D_ltc = 0;
  } else {
    D_ltc = double.parse('$S_ltc');
  }

  if (S_uni!.isEmpty) {
    D_uni = 0;
  } else {
    D_uni = double.parse('$S_uni');
  }

  if (S_ada!.isEmpty) {
    D_ada = 0;
  } else {
    D_ada = double.parse('$S_ada');
  }

  if (S_usdc!.isEmpty) {
    D_usdc = 0;
  } else {
    D_usdc = double.parse('$S_usdc');
  }

  if (S_btc!.isNotEmpty &&
      S_ltc!.isEmpty &&
      S_ada!.isEmpty &&
      S_uni!.isEmpty &&
      S_usdc!.isEmpty &&
      S_reais!.isEmpty) {
    _btcChanged(D_btc);
  } else if (S_btc!.isEmpty &&
      S_ltc!.isNotEmpty &&
      S_ada!.isEmpty &&
      S_uni!.isEmpty &&
      S_usdc!.isEmpty &&
      S_reais!.isEmpty) {
    _ltcChanged(D_ltc);
  } else if (S_btc!.isEmpty &&
      S_ltc!.isEmpty &&
      S_ada!.isNotEmpty &&
      S_uni!.isEmpty &&
      S_usdc!.isEmpty &&
      S_reais!.isEmpty) {
    _adaChanged(D_ada);
  } else if (S_btc!.isEmpty &&
      S_ltc!.isEmpty &&
      S_ada!.isEmpty &&
      S_uni!.isNotEmpty &&
      S_usdc!.isEmpty &&
      S_reais!.isEmpty) {
    _uniChanged(D_uni);
  } else if (S_btc!.isEmpty &&
      S_ltc!.isEmpty &&
      S_ada!.isEmpty &&
      S_uni!.isEmpty &&
      S_usdc!.isNotEmpty &&
      S_reais!.isEmpty) {
    _usdcChanged(D_usdc);
  } else if (S_btc!.isEmpty &&
      S_ltc!.isEmpty &&
      S_ada!.isEmpty &&
      S_uni!.isEmpty &&
      S_usdc!.isEmpty &&
      S_reais!.isNotEmpty) {
    _realChanged(D_reais);
  } else {
    _clearAll();
  }
}

void _realChanged(double valor) {
  print('ENTROU NO REAL CHANGE');

  double _real = valor;
  btcController.text = (_real / btc).toStringAsFixed(6);
  ltcController.text = (_real / ltc).toStringAsFixed(6);
  adaController.text = (_real / ada).toStringAsFixed(3);
  uniController.text = (_real / uni).toStringAsFixed(3);
  usdcController.text = (_real / usdc).toStringAsFixed(3);
}

void _btcChanged(double cripto) {
  print('ENTROU NO BTC CHANGE');

  double _btc = cripto;

  ltcController.text = ((_btc * btc) / ltc).toStringAsFixed(6);
  adaController.text = ((_btc * btc) / ada).toStringAsFixed(6);
  uniController.text = ((_btc * btc) / uni).toStringAsFixed(6);
  usdcController.text = ((_btc * btc) / usdc).toStringAsFixed(6);
  realController.text = (_btc * btc).toStringAsFixed(2);
}

void _ltcChanged(double cripto) {
  print('ENTROU NO LTC CHANGE');

  double _ltc = cripto;
  btcController.text = (_ltc * ltc / btc).toStringAsFixed(6);
  adaController.text = (_ltc * ltc / ada).toStringAsFixed(6);
  uniController.text = (_ltc * ltc / uni).toStringAsFixed(6);
  usdcController.text = (_ltc * ltc / usdc).toStringAsFixed(6);
  realController.text = (_ltc * ltc).toStringAsFixed(2);
}

void _adaChanged(double cripto) {
  print('ENTROU NO ADA CHANGE');

  double _ada = cripto;
  btcController.text = (_ada * ada / btc).toStringAsFixed(6);
  ltcController.text = (_ada * ada / ltc).toStringAsFixed(6);
  uniController.text = (_ada * ada / uni).toStringAsFixed(6);
  usdcController.text = (_ada * ada / usdc).toStringAsFixed(6);
  realController.text = (_ada * ada).toStringAsFixed(2);
}

void _uniChanged(double cripto) {
  print('ENTROU NO UNI CHANGE');

  double _uni = cripto;
  btcController.text = (_uni * uni / btc).toStringAsFixed(6);
  ltcController.text = (_uni * uni / ltc).toStringAsFixed(6);
  adaController.text = (_uni * uni / ada).toStringAsFixed(6);
  usdcController.text = (_uni * uni / usdc).toStringAsFixed(6);
  realController.text = (_uni * uni).toStringAsFixed(2);
}

void _usdcChanged(double cripto) {
  print('ENTROU NO USDC CHANGE');

  double _usdc = cripto;
  btcController.text = (_usdc * usdc / btc).toStringAsFixed(6);
  ltcController.text = (_usdc * usdc / ltc).toStringAsFixed(6);
  adaController.text = (_usdc * usdc / ada).toStringAsFixed(6);
  uniController.text = (_usdc * usdc / uni).toStringAsFixed(6);
  realController.text = (_usdc * usdc).toStringAsFixed(2);
}

void _clearAll() {
  btcController.text = "";
  ltcController.text = "";
  adaController.text = "";
  uniController.text = "";
  usdcController.text = "";
  realController.text = "";
}

Widget buildSearchCriptoButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: RaisedButton(
      onPressed: getData,
      child: _loading
          ? circularLoading()
          : Text(
              'CONVERTER CRIPTOS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.amberAccent,
    ),
  );
}

Widget buildButtonLimparCampos() {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: RaisedButton(
      onPressed: _clearAll,
      child: _loading
          ? circularLoading()
          : Text(
              'LIMPAR CAMPOS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.red,
    ),
  );
}

Widget circularLoading() {
  return Container(
    height: 15.0,
    width: 15.0,
    child: CircularProgressIndicator(),
  );
}

Widget buildTextField(String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
      prefixStyle: TextStyle(
        color: Colors.amber,
        fontSize: 25.0,
      ),
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    keyboardType: TextInputType.number,
  );
}
