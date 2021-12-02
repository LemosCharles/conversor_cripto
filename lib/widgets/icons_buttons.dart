// ignore_for_file: prefer_const_constructors, deprecated_member_use, duplicate_ignore, sized_box_for_whitespace, unused_element, avoid_print

import 'package:conversor_moedas_flutter/models/variaveis.dart';
import 'package:conversor_moedas_flutter/services/get_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildAcoes(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 35,
              ),
              onPressed: () {
                getData(context);
              },
            ),
            Text(
              'Verificar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.clear_outlined,
                color: Colors.red,
                size: 35,
              ),
              onPressed: () {
                _clearAll();
              },
            ),
            Text(
              'Limpar Campos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

// Funções auxiliares

void _clearAll() {
  btcController.text = "";
  ltcController.text = "";
  adaController.text = "";
  uniController.text = "";
  usdcController.text = "";
  realController.text = "";
}
