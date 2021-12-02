// Auxiliares de calculo
// ignore_for_file: unused_element, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

double btc = 0;
double ltc = 0;
double ada = 0;
double uni = 0;
double usdc = 0;
double reais = 0;
double D_aux = 0;
double D_btc = 0;
double D_ltc = 0;
double D_ada = 0;
double D_uni = 0;
double D_usdc = 0;
double D_reais = 0;

// Auxiliares for request api
String? Btc_last = '';
String? Ltc_last = '';
String? Ada_last = '';
String? Uni_last = '';
String? Usdc_last = '';
String? Real_last = '';
String? S_btc = '';
String? S_ltc = '';
String? S_ada = '';
String? S_uni = '';
String? S_usdc = '';
String? S_reais = '';

// Booleans
bool _erro = true;
bool _loading = false;
bool _enableField = true;
bool _caracterCorreto = false;

// Controllers
final btcController = TextEditingController();
final ltcController = TextEditingController();
final adaController = TextEditingController();
final uniController = TextEditingController();
final usdcController = TextEditingController();
final realController = TextEditingController();

// Auxiliar via api
var resultCripto;

// Fush Bar
var titleSnackBar = '';
var massageSnackBar = '';
final List<Flushbar> flushBars = [];
