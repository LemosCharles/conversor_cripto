// ignore: file_names
// ignore: file_names
// ignore: file_names

// ignore_for_file: prefer_const_constructors, duplicate_ignore, file_names, avoid_print

import 'package:another_flushbar/flushbar.dart';
import 'package:conversor_moedas_flutter/models/variaveis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future show(BuildContext context, Flushbar newFlushBar) async {
  await Future.wait(flushBars.map((flushBar) => flushBar.dismiss()).toList());
  flushBars.clear();

  newFlushBar.show(context);
  flushBars.add(newFlushBar);
}

void showTopSnackBar(BuildContext context) => show(
      context,
      Flushbar(
        // ignore: prefer_const_constructors
        icon: Icon(
          Icons.error,
          size: 40,
          color: Colors.red,
        ),

        shouldIconPulse: false,
        title: titleSnackBar,
        message: massageSnackBar,

        onTap: (_) {
          print('Clicked bar');
        },
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
        borderRadius: BorderRadius.circular(10),
        //borderRadius: 16,
      ),
    );
