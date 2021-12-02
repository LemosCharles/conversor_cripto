// ignore_for_file: prefer_const_constructors, deprecated_member_use, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextField(String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.black26),
      border: OutlineInputBorder(),
      prefixText: prefix,
      prefixStyle: TextStyle(
        color: Colors.black45,
        fontSize: 20.0,
      ),
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    keyboardType: TextInputType.number,
  );
}
