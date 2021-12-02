// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_print, unused_import, avoid_web_libraries_in_flutter, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, unused_label, unused_local_variable

import 'package:another_flushbar/flushbar.dart';
import 'package:conversor_moedas_flutter/models/variaveis.dart';
import 'package:conversor_moedas_flutter/notifications/flushBar_notifications.dart';
import 'package:conversor_moedas_flutter/notifications/validator_caracter.dart';
import 'package:conversor_moedas_flutter/services/via_cripto_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future getData(BuildContext context) async {
  // Requisições Via Service
  resultCripto = await ViaCriptoService.fetchCripto('BTC');
  Btc_last = resultCripto.ticker.last;
  resultCripto = await ViaCriptoService.fetchCripto('LTC');
  Ltc_last = resultCripto.ticker.buy;
  resultCripto = await ViaCriptoService.fetchCripto('ADA');
  Ada_last = resultCripto.ticker.buy;
  resultCripto = await ViaCriptoService.fetchCripto('UNI');
  Uni_last = resultCripto.ticker.buy;
  resultCripto = await ViaCriptoService.fetchCripto('USDC');
  Usdc_last = resultCripto.ticker.buy;

  // Recebe controllers para posterior validação
  S_btc = btcController.text;
  S_ltc = ltcController.text;
  S_ada = adaController.text;
  S_uni = uniController.text;
  S_usdc = usdcController.text;
  S_reais = realController.text;

  if (digitacaoIncorreta()) {
    titleSnackBar = 'Caracter incorreto!';
    massageSnackBar = 'Favor, revise sua digitação.';
    showTopSnackBar(context);
    _clearAll();
  } else {
    if (S_reais!.isEmpty &&
        S_btc!.isEmpty &&
        S_ltc!.isEmpty &&
        S_uni!.isEmpty &&
        S_ada!.isEmpty &&
        S_usdc!.isEmpty) {
      titleSnackBar = 'Campos em branco!';
      massageSnackBar = 'Favor, informe um valor para conversão.';
      showTopSnackBar(context);
    } else {
// Conversão das requisições via API para double
      btc = double.parse('$Btc_last');
      ltc = double.parse('$Ltc_last');
      ada = double.parse('$Ada_last');
      uni = double.parse('$Uni_last');
      usdc = double.parse('$Usdc_last');

      // Validações pré calculo de conversão
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

      // Valida qual calculo de conversão irá fazer
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
  }
}

// SESSÃO DE CALCULOS

void _realChanged(double valor) {
  double _real = valor;
  btcController.text = (_real / btc).toStringAsFixed(6);
  ltcController.text = (_real / ltc).toStringAsFixed(6);
  adaController.text = (_real / ada).toStringAsFixed(3);
  uniController.text = (_real / uni).toStringAsFixed(3);
  usdcController.text = (_real / usdc).toStringAsFixed(3);
}

void _btcChanged(double cripto) {
  double _btc = cripto;
  ltcController.text = ((_btc * btc) / ltc).toStringAsFixed(6);
  adaController.text = ((_btc * btc) / ada).toStringAsFixed(6);
  uniController.text = ((_btc * btc) / uni).toStringAsFixed(6);
  usdcController.text = ((_btc * btc) / usdc).toStringAsFixed(6);
  realController.text = (_btc * btc).toStringAsFixed(2);
}

void _ltcChanged(double cripto) {
  double _ltc = cripto;
  btcController.text = (_ltc * ltc / btc).toStringAsFixed(6);
  adaController.text = (_ltc * ltc / ada).toStringAsFixed(6);
  uniController.text = (_ltc * ltc / uni).toStringAsFixed(6);
  usdcController.text = (_ltc * ltc / usdc).toStringAsFixed(6);
  realController.text = (_ltc * ltc).toStringAsFixed(2);
}

void _adaChanged(double cripto) {
  double _ada = cripto;
  btcController.text = (_ada * ada / btc).toStringAsFixed(6);
  ltcController.text = (_ada * ada / ltc).toStringAsFixed(6);
  uniController.text = (_ada * ada / uni).toStringAsFixed(6);
  usdcController.text = (_ada * ada / usdc).toStringAsFixed(6);
  realController.text = (_ada * ada).toStringAsFixed(2);
}

void _uniChanged(double cripto) {
  double _uni = cripto;
  btcController.text = (_uni * uni / btc).toStringAsFixed(6);
  ltcController.text = (_uni * uni / ltc).toStringAsFixed(6);
  adaController.text = (_uni * uni / ada).toStringAsFixed(6);
  usdcController.text = (_uni * uni / usdc).toStringAsFixed(6);
  realController.text = (_uni * uni).toStringAsFixed(2);
}

void _usdcChanged(double cripto) {
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
