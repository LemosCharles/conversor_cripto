// ignore_for_file: prefer_const_constructors, deprecated_member_use, duplicate_ignore, sized_box_for_whitespace

import 'package:conversor_moedas_flutter/services/get_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSearchCriptoButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: RaisedButton(
      onPressed: getData,
      child: Text(
        'CONVERTER CRIPTOS',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.blueGrey,
    ),
  );
}
