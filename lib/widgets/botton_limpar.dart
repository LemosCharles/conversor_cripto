// ignore_for_file: prefer_const_constructors, deprecated_member_use, duplicate_ignore, sized_box_for_whitespace

import 'package:conversor_moedas_flutter/models/variaveis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildButtonLimparCampos() {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: RaisedButton(
      onPressed: _clearAll,
      // ignore: prefer_const_constructors
      child: Text(
        'LIMPAR CAMPOS',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.red,
    ),
  );
}

void _clearAll() {
  btcController.text = "";
  ltcController.text = "";
  adaController.text = "";
  uniController.text = "";
  usdcController.text = "";
  realController.text = "";
}
