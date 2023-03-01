import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/cursoDt.dart';
import 'package:tesis/data/model/curso.dart';
import 'package:tesis/data/model/cursoDet.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';

class InscripcionProvider extends ChangeNotifier {
  TextEditingController ctrDescripcion = TextEditingController();
  ModelFamiliares? socioSelect;
  ModelViewHorarios? horariosSelect;
  List<ModelCursoDet> detalles = [];

  CursoDataSource _datasource = CursoDataSource();

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
      if (socioSelect != null && horariosSelect != null) {
        ModelCursoDet det = ModelCursoDet(
            id: 0,
            idCab: 0,
            idHorario: horariosSelect!.id,
            idSocio: socioSelect!.id);
        det.socioSelect = socioSelect;
        det.horariosSelect = horariosSelect;
        detalles.add(det);
        notifyListeners();
        socioSelect = null;
        horariosSelect = null;
      }
    } catch (e) {}
  }

  Future<bool> guardar() async {
    try {
      ModelCurso curso = ModelCurso(
          id: 0,
          estado: "A",
          periodo: mesSelect,
          descripcion: ctrDescripcion.text);

      var result = await _datasource.postCursos(curso);
      if (result.id != 0) {
        for (var element in detalles) {
          element.idCab = result.id;
          await _datasource.postCursosDet(element);
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
