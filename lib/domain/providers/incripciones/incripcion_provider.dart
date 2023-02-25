import 'package:flutter/material.dart';

class InscripcionProvider extends ChangeNotifier {
  TextEditingController ctrDescripcion = TextEditingController();

  String mesSelect = "";
  List<String> listadoMeses = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre"
  ];
}
