// ignore_for_file: unused_import, prefer_final_fields, unused_field, prefer_const_constructors, use_key_in_widget_constructors, avoid_print, non_constant_identifier_names, unnecessary_cast, void_checks, prefer_typing_uninitialized_variables, unused_element, deprecated_member_use, sized_box_for_whitespace, unused_local_variable, unrelated_type_equality_checks, unnecessary_string_interpolations, unnecessary_null_comparison

import 'package:conversor_moedas_flutter/models/result_cripto.dart';
import 'package:conversor_moedas_flutter/models/variaveis.dart';
import 'package:conversor_moedas_flutter/notifications/flushBar_notifications.dart';
import 'package:conversor_moedas_flutter/notifications/validator_caracter.dart';
import 'package:conversor_moedas_flutter/services/get_data.dart';
import 'package:conversor_moedas_flutter/services/via_cripto_service.dart';
import 'package:conversor_moedas_flutter/share/share.dart';
import 'package:conversor_moedas_flutter/widgets/icons_buttons.dart';
import 'package:conversor_moedas_flutter/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CONVERSOR CRIPTOS'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                getShare(context);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Divider(),
                buildTextField("BRL", "R\$ ", realController),
                Divider(),
                buildTextField("Bitcoin", "Quantidade = ", btcController),
                Divider(),
                buildTextField("LiteCoin", "Quantidade = ", ltcController),
                Divider(),
                buildTextField("Cardano", "Quantidade = ", adaController),
                Divider(),
                buildTextField("UniSwap", "Quantidade = ", uniController),
                Divider(),
                buildTextField("UsdCoion", "Quantidade = ", usdcController),
                buildAcoes(context),
              ],
            )));
  }
}
