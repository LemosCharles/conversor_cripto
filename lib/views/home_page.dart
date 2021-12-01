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

// variables for request api
String? Btc_last = '';
String? Ltc_last = '';
String? Ada_last = '';
String? Uni_last = '';
String? Usdc_last = '';
String? Real_last = '';
var resultCripto;

// booleans
bool _erro = true;
bool _loading = false;
bool _enableField = true;

//controllers

final btcController = TextEditingController();
final ltcController = TextEditingController();
final adaController = TextEditingController();
final uniController = TextEditingController();
final usdcController = TextEditingController();
final realController = TextEditingController();

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
                buildTextField_btc("Valor (R\$)", "R\$ ", realController),
                Divider(),
                buildTextField_btc("Bitcoin", "", btcController),
                Divider(),
                buildTextField_ltc("LiteCoin", "", ltcController),
                Divider(),
                buildTextField_ada("Cardano", "", adaController),
                Divider(),
                buildTextField_uni("UniSwap", "", uniController),
                Divider(),
                buildTextField_usdc("UsdCoion", "", usdcController),
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

  String? S_btc = btcController.text;
  String? S_ltc = ltcController.text;
  String? S_ada = adaController.text;
  String? S_uni = uniController.text;
  String? S_usdc = usdcController.text;
  String? S_reais = realController.text;

  if (S_reais.isEmpty) {
    reais = 0;
  } else {
    reais = double.parse('$S_reais');
  }

  btc = double.parse('$Btc_last');
  ltc = double.parse('$Ltc_last');
  ada = double.parse('$Ada_last');
  uni = double.parse('$Uni_last');
  usdc = double.parse('$Usdc_last');

  if (S_btc.isNotEmpty &&
      S_ltc.isEmpty &&
      S_ada.isEmpty &&
      S_uni.isEmpty &&
      S_usdc.isEmpty &&
      S_reais.isEmpty) {
    _btcChanged(btc);
  } else if (S_btc.isEmpty &&
      S_ltc.isNotEmpty &&
      S_ada.isEmpty &&
      S_uni.isEmpty &&
      S_usdc.isEmpty &&
      S_reais.isEmpty) {
    _ltcChanged(ltc);
  } else if (S_btc.isEmpty &&
      S_ltc.isEmpty &&
      S_ada.isNotEmpty &&
      S_uni.isEmpty &&
      S_usdc.isEmpty &&
      S_reais.isEmpty) {
    _adaChanged(ada);
  } else if (S_btc.isEmpty &&
      S_ltc.isEmpty &&
      S_ada.isEmpty &&
      S_uni.isNotEmpty &&
      S_usdc.isEmpty &&
      S_reais.isEmpty) {
    _uniChanged(uni);
  } else if (S_btc.isEmpty &&
      S_ltc.isEmpty &&
      S_ada.isEmpty &&
      S_uni.isEmpty &&
      S_usdc.isNotEmpty &&
      S_reais.isEmpty) {
    _usdcChanged(usdc);
  } else if (S_btc.isEmpty &&
      S_ltc.isEmpty &&
      S_ada.isEmpty &&
      S_uni.isEmpty &&
      S_usdc.isEmpty &&
      S_reais.isNotEmpty) {
    _realChanged(reais);
  } else {
    _clearAll();
  }
}

void _realChanged(double valor) {
  print('ENTROU NO REAL CHANGE');

  double _real = valor;
  btcController.text = (_real / btc).toStringAsFixed(6);
  adaController.text = (_real / ada).toStringAsFixed(6);
  ltcController.text = (_real / ltc).toStringAsFixed(6);
  uniController.text = (_real / uni).toStringAsFixed(6);
  usdcController.text = (_real / usdc).toStringAsFixed(6);
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
  ltcController.text = (_ltc * btc / ltc).toStringAsFixed(6);
  adaController.text = (_ltc * btc / ada).toStringAsFixed(6);
  uniController.text = (_ltc * btc / uni).toStringAsFixed(6);
  usdcController.text = (_ltc * btc / usdc).toStringAsFixed(6);
  realController.text = (_ltc * btc).toStringAsFixed(2);
}

void _adaChanged(double cripto) {
  print('ENTROU NO ADA CHANGE');

  double _ada = cripto;
  ltcController.text = (_ada * btc / ltc).toStringAsFixed(6);
  adaController.text = (_ada * btc / ada).toStringAsFixed(6);
  uniController.text = (_ada * btc / uni).toStringAsFixed(6);
  usdcController.text = (_ada * btc / usdc).toStringAsFixed(6);
  realController.text = (_ada * btc).toStringAsFixed(2);
}

void _uniChanged(double cripto) {
  print('ENTROU NO UNI CHANGE');

  double _uni = cripto;
  ltcController.text = (_uni * btc / ltc).toStringAsFixed(6);
  adaController.text = (_uni * btc / ada).toStringAsFixed(6);
  uniController.text = (_uni * btc / uni).toStringAsFixed(6);
  usdcController.text = (_uni * btc / usdc).toStringAsFixed(6);
  realController.text = (_uni * btc).toStringAsFixed(2);
}

void _usdcChanged(double cripto) {
  print('ENTROU NO USDC CHANGE');

  double _usdc = cripto;
  ltcController.text = (_usdc * btc / ltc).toStringAsFixed(6);
  adaController.text = (_usdc * btc / ada).toStringAsFixed(6);
  uniController.text = (_usdc * btc / uni).toStringAsFixed(6);
  usdcController.text = (_usdc * btc / usdc).toStringAsFixed(6);
  realController.text = (_usdc * btc).toStringAsFixed(2);
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

Widget buildTextField_reais(
    String label, String prefix, TextEditingController c) {
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

Widget buildTextField_btc(
    String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    keyboardType: TextInputType.number,
  );
}

Widget buildTextField_ltc(
    String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    keyboardType: TextInputType.number,
  );
}

Widget buildTextField_ada(
    String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    keyboardType: TextInputType.number,
  );
}

Widget buildTextField_uni(
    String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    keyboardType: TextInputType.number,
  );
}

Widget buildTextField_usdc(
    String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    keyboardType: TextInputType.number,
  );
}
