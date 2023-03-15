import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/cursoDt.dart';
import 'package:tesis/data/datasource/familiaresDT.dart';
import 'package:tesis/data/datasource/horarios.dart';
import 'package:tesis/data/datasource/inscripcionDT.dart';
import 'package:tesis/data/model/curso.dart';
import 'package:tesis/data/model/cursoDet.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/data/model/inscripcion.dart';

class InscripcionProvider extends ChangeNotifier {
  TextEditingController ctrDescripcion = TextEditingController();
  ModelFamiliares? socioSelect;
  ModelViewHorarios? horariosSelect;
  List<ModelCursoDet> detalles = [];
  List<ModelCurso> lisCursos = [];
  List<ModelFamiliares> listadoFamiliares = [];
  List<ModelViewHorarios> lisHorarios = [];

  final CursoDataSource _datasource = CursoDataSource();
  final FamiliaresDataSource _dataSourceFamiliar = FamiliaresDataSource();
  final InscripcionDataSource _dataSourceInscripcion = InscripcionDataSource();

  final HorariosDatasource _datasourceHorario = HorariosDatasource();

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

  ModelCurso? cursoSelect;
  bool edit = false;

  Future getFamiliares() async {
    try {
      listadoFamiliares = await _dataSourceFamiliar.getFamiliares();
    } catch (e) {}
  }

  Future getHorarios() async {
    try {
      lisHorarios = await _datasourceHorario.getHorarios();
    } catch (e) {}
  }

  Future getCursos() async {
    try {
      lisCursos = await _datasource.getCursos();
      notifyListeners();
    } catch (e) {}
  }

  Future inicilizar() async {
    try {
      if (edit) {
        mesSelect = cursoSelect!.periodo;
        ctrDescripcion = TextEditingController(text: cursoSelect!.descripcion);
        detalles = [];
        socioSelect = null;
        horariosSelect = null;

        var cursoDet = await _datasource.getCursosDet(cursoSelect!.id);

        await getFamiliares();
        await getHorarios();
        for (var element in cursoDet) {
          var obj1 =
              listadoFamiliares.firstWhere((e) => e.id == element.idSocio);
          if (obj1 != null) {
            element.socioSelect = obj1;
          }
        }
        detalles = cursoDet;
        notifyListeners();
      } else {
        mesSelect = "";
        ctrDescripcion = TextEditingController();
        detalles = [];
        socioSelect = null;
        horariosSelect = null;
      }
    } catch (e) {}
  }

  void agregarDetalle() {
    try {
      if (socioSelect != null && horariosSelect != null) {
        ModelCursoDet det = ModelCursoDet(
            id: 0, idCab: 0, idHorario: 0, idSocio: socioSelect!.id);
        det.socioSelect = socioSelect;
        //det.horariosSelect = horariosSelect;
        detalles.add(det);
        notifyListeners();
        socioSelect = null;
        //horariosSelect = null;
      }
    } catch (e) {}
  }

  Future<bool> guardar() async {
    try {
// primero que se cree la inscripcion y despues lo agrega al curso

      ModelIncripcion insc = ModelIncripcion(
          id: 0,
          estado: "A",
          descripcion: ctrDescripcion.text,
          idFamiliar: socioSelect!.id,
          idHorario: horariosSelect!.id,
          periodo: mesSelect);

      if (await _dataSourceInscripcion.postApiInscripcion(insc)) {





        ModelCurso curso = ModelCurso(
            id: cursoSelect == null ? 0 : cursoSelect!.id,
            estado: "A",
            periodo: mesSelect,
            descripcion: ctrDescripcion.text,
            id_horario: horariosSelect!.id);

        if (edit) {
          var result = await _datasource.postActualizarCursos(curso);
        } else {
          var result = await _datasource.postCursos(curso);
          if (result.id != 0) {
            for (var element in detalles) {
              element.idCab = result.id;
              await _datasource.postCursosDet(element);
            }
          }
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> anular() async {
    try {
      var result = await _datasource.postAnularCursos(cursoSelect!);
      if (result.id != 0) {
        cursoSelect!.estado = "I";
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
