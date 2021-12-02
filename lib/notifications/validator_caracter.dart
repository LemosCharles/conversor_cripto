// ignore_for_file: void_checks, unused_local_variable

import 'package:conversor_moedas_flutter/models/variaveis.dart';

bool digitacaoIncorreta() {
  // Valida se existe digição de letras nos campos númericos
  if (S_btc!.contains(RegExp(r'[A-Z]')) == true ||
      S_btc!.contains(RegExp(r'[a-z]')) == true ||
      S_ltc!.contains(RegExp(r'[A-Z]')) == true ||
      S_ltc!.contains(RegExp(r'[a-z]')) == true ||
      S_uni!.contains(RegExp(r'[A-Z]')) == true ||
      S_uni!.contains(RegExp(r'[a-z]')) == true ||
      S_ada!.contains(RegExp(r'[A-Z]')) == true ||
      S_ada!.contains(RegExp(r'[a-z]')) == true ||
      S_usdc!.contains(RegExp(r'[A-Z]')) == true ||
      S_usdc!.contains(RegExp(r'[a-z]')) == true ||
      S_reais!.contains(RegExp(r'[A-Z]')) == true ||
      S_reais!.contains(RegExp(r'[a-z]')) == true) {
    return true;
  } else {
    return false;
  }
}
