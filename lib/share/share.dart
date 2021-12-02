// ignore_for_file: unused_element, unused_import

import 'package:conversor_moedas_flutter/models/variaveis.dart';
import 'package:conversor_moedas_flutter/notifications/flushBar_notifications.dart';
import 'package:conversor_moedas_flutter/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';

Future getShare(BuildContext context) async {
  _share(context);
}

void _share(BuildContext context) {
  if (realController.text.isEmpty ||
      btcController.text.isEmpty ||
      ltcController.text.isEmpty ||
      uniController.text.isEmpty ||
      adaController.text.isEmpty ||
      usdcController.text.isEmpty) {
    titleSnackBar = 'Atenção!';
    massageSnackBar = 'Conversão inválida! Revise a digitação.';
    showTopSnackBar(context);
  } else {
    Share.share(
        "COTAÇÕES CONVERTIDAS: BRL (R\$) = ${realController.text}, BTC (und) =  ${btcController.text}, LTC (und) =  ${ltcController.text}, UNI (und) =  ${uniController.text}, ADA (und) =  ${adaController.text}, USDC (und) =  ${usdcController.text}");
  }
}
