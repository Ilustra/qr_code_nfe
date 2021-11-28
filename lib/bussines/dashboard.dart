import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Dashboard {
  final String cnpj;
  final String nome;
  final double total;
  final int size;
  final charts.Color barColor;
  final Color color;

  Dashboard(
      {required this.cnpj,
      required this.nome,
      required this.total,
      required this.size,
      required this.barColor,
      required this.color});

  factory Dashboard.fromJson(dynamic json) {
    Color colors = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Dashboard(
        nome: json['nome'],
        total: json['total'].toDouble(),
        cnpj: json['cnpj'],
        color: colors,
        size: json['total'] as int,
        barColor: charts.ColorUtil.fromDartColor(colors));
  }
  formatMoeda(double valor) {
    final formatter = new NumberFormat("#,###.##");

    double value = valor;

    return formatter.format(value);
  }

  String getTotal() {
    return '\$ ' + (formatMoeda(total).toString());
  }

  String getName() {
    return nome.toString();
  }
}