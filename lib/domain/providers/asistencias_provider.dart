import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tesis/data/datasource/asistenciaDT.dart';
import 'package:tesis/data/datasource/horarios.dart';
import 'package:tesis/data/model/asistencia.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/data/model/viewAsistencia.dart';

class AsistenciasProvider extends ChangeNotifier {
  TextEditingController ctrDescripcion = TextEditingController();
  TextEditingController ctrFecha = TextEditingController();

  List<ModelAsistencia> listAsistencias = [];
  List<ModelViewAsistencia> listDetalle = [];
  List<ModelViewHorarios> lisHorarios = [];

  final AsistenciaDataSource _dataSource = AsistenciaDataSource();
  final HorariosDatasource _datasourceHorario = HorariosDatasource();

  ModelViewHorarios? infoDisciplina;
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

  ModelAsistencia? asistenciaSelect;
  bool edit = false;

  Future getHorarios() async {
    try {
      lisHorarios = await _datasourceHorario.getHorarios();
      notifyListeners();
    } catch (e) {}
  }

  Future inicializar() async {
    try {
      await getHorarios();
      if (edit) {
        ctrDescripcion =
            TextEditingController(text: asistenciaSelect!.descripcion);
        ctrFecha = TextEditingController(
            text: DateFormat('dd-MM-yyyy').format(asistenciaSelect!.fecha));
        mesSelect = asistenciaSelect!.periodo;

        infoDisciplina =
            lisHorarios.firstWhere((e) => e.id == asistenciaSelect!.idHorario);
      } else {
        ctrDescripcion = TextEditingController();
        ctrFecha = TextEditingController();
        infoDisciplina = null;
        mesSelect = "";
        listDetalle = [];
      }
    } catch (e) {}
  }

  Future getAsistencia() async {
    try {
      listAsistencias = await _dataSource.getAsistencias();
      notifyListeners();
    } catch (e) {}
  }

  Future cargarSocios(String periodo, int disciplina) async {
    try {
      listDetalle = await _dataSource.cargarCita(periodo, disciplina);
      notifyListeners();
    } catch (e) {}
  }

  Future<bool> guardar() async {
    try {
      ModelAsistencia asis = ModelAsistencia(
          idAsistencia: 0,
          estado: "A",
          periodo: mesSelect,
          descripcion: ctrDescripcion.text,
          idHorario: infoDisciplina!.id,
          fecha: DateTime.parse(ctrFecha.text));

      var result = await _dataSource.postAsistencias(asis);
      if (result.idAsistencia != 0) {
        for (var element in listDetalle) {
          ModelAsistenciaDet det = ModelAsistenciaDet(
            secuencia: 0,
            asistenciasCab: result.idAsistencia,
            motivo: "",
            idSocio: element.id,
            asistencia: element.asistencia,
            falta: element.faltaJustificada,
            retraso: element.atraso,
          );

          await _dataSource.postAsistenciasDet(det);
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> anular() async {
    try {
      var result = await _dataSource.postAnular(asistenciaSelect!);
      if (result.idAsistencia != 0) {
        asistenciaSelect!.estado = "I";
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
