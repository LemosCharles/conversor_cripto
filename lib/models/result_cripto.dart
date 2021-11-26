// To parse this JSON data, do
//
//     final resultCripto = resultCriptoFromMap(jsonString);

// ignore_for_file: unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

class ResultCripto {
  ResultCripto({
    required this.ticker,
  });

  Ticker ticker;

  factory ResultCripto.fromJson(String str) =>
      ResultCripto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultCripto.fromMap(Map<String, dynamic> json) => ResultCripto(
        ticker: Ticker.fromMap(json["ticker"]),
      );

  Map<String, dynamic> toMap() => {
        "ticker": ticker.toMap(),
      };
}

class Ticker {
  Ticker({
    required this.high,
    required this.low,
    required this.vol,
    required this.last,
    required this.buy,
    required this.sell,
    required this.open,
    required this.date,
  });

  String high;
  String low;
  String vol;
  String last;
  String buy;
  String sell;
  String open;
  int date;

  factory Ticker.fromJson(String str) => Ticker.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ticker.fromMap(Map<String, dynamic> json) => Ticker(
        high: json["high"],
        low: json["low"],
        vol: json["vol"],
        last: json["last"],
        buy: json["buy"],
        sell: json["sell"],
        open: json["open"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "high": high,
        "low": low,
        "vol": vol,
        "last": last,
        "buy": buy,
        "sell": sell,
        "open": open,
        "date": date,
      };
}
