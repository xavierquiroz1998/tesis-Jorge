import 'package:flutter/material.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';

class InscripcionProvider extends ChangeNotifier {
  TextEditingController ctrDescripcion = TextEditingController();
  ModelFamiliares? socioSelect;
  ModelViewHorarios? disciplinaSelect;
  List<InscripcionDet> detalles = [];

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

  void agregarDetalle() {
    try {
      if (socioSelect != null && disciplinaSelect != null) {
        InscripcionDet det = InscripcionDet();
        det.socioSelect = socioSelect;
        det.disciplinaSelect = disciplinaSelect;
        detalles.add(det);
        notifyListeners();
        socioSelect = null;
        disciplinaSelect = null;
      }
    } catch (e) {}
  }
}

class InscripcionDet {
  ModelFamiliares? socioSelect;
  ModelViewHorarios? disciplinaSelect;
}
