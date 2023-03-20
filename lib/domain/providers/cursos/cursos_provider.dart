import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/cursoDt.dart';
import 'package:tesis/data/datasource/disciplinas.dart';
import 'package:tesis/data/datasource/familiaresDT.dart';
import 'package:tesis/data/datasource/horarios.dart';
import 'package:tesis/data/model/curso.dart';
import 'package:tesis/data/model/cursoDet.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/data/model/profesor.dart';

class CurosProvider extends ChangeNotifier {
  TextEditingController ctrDescripcion = TextEditingController();
  List<ModelDisciplina> listDisciplina = [];
  List<ModelViewHorarios> lisHorarios = [];
  List<ModelFamiliares> listadoFamiliares = [];
  List<ModelCursoDet> detalles = [];
  List<ModelCurso> lisCursos = [];
  ModelProfesor? profesor;

  ModelDisciplina? disciplinaSlect;
  ModelFamiliares? socioSelect;
  ModelViewHorarios? horariosSelect;
  ModelCurso? cursoSelect;

  final Disciplinas _datasourceDisciplina = Disciplinas();
  final CursoDataSource _datasource = CursoDataSource();
  final FamiliaresDataSource _dataSourceFamiliar = FamiliaresDataSource();
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

  Future getDisciplinas() async {
    try {
      listDisciplina = await _datasourceDisciplina.getDisciplinas();
      notifyListeners();
    } catch (e) {}
  }

  Future getCursos() async {
    try {
      lisCursos = await _datasource.getCursos();
      notifyListeners();
    } catch (e) {}
  }

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

  Future getHorarios_x_disciplina(int idDisciplina) async {
    try {
      lisHorarios =
          await _datasourceHorario.getHorarios_x_disciplina(idDisciplina);
      notifyListeners();
    } catch (e) {}
  }

  Future getProfesor_x_Horario(int idHorario) async {
    try {
      profesor = await _datasourceHorario.getProfesor_x_horario(idHorario);
      notifyListeners();
    } catch (e) {}
  }

  bool agregarDetalle() {
    try {
      if (socioSelect != null && horariosSelect != null) {
        ModelCursoDet? existeSocio = detalles.firstWhere(
          (e) => e.idSocio == socioSelect!.id,
          orElse: () =>
              ModelCursoDet(id: 0, idCab: 0, idHorario: 0, idSocio: 0),
        );

        if (existeSocio.idSocio == 0) {
          ModelCursoDet det = ModelCursoDet(
              id: 0, idCab: 0, idHorario: 0, idSocio: socioSelect!.id);
          det.socioSelect = socioSelect;
          //det.horariosSelect = horariosSelect;
          detalles.add(det);
          notifyListeners();
          socioSelect = null;
          return true;
        }
        //horariosSelect = null;
      }
    } catch (e) {}
    return false;
  }

  Future inicilizar() async {
    try {
      if (cursoSelect != null) {
        mesSelect = cursoSelect!.periodo;
        ctrDescripcion = TextEditingController(text: cursoSelect!.descripcion);
        detalles = [];
        socioSelect = null;
        horariosSelect = null;

        var cursoDet = await _datasource.getCursosDet(cursoSelect!.id);

        await getFamiliares();
        await getHorarios();

        var obj1 =
            lisHorarios.firstWhere((e) => e.id == cursoSelect!.id_horario);
        if (obj1 != null) {
          horariosSelect = obj1;
        }

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

  Future<bool> existeCurso() async {
    try {
      var existeCurso =
          await _datasource.getExisteCurso(mesSelect, horariosSelect!.id);
      if (existeCurso == null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> guardar() async {
    try {
      var existeCurso =
          await _datasource.getExisteCurso(mesSelect, horariosSelect!.id);

      if (existeCurso == null) {
        ModelCurso curso = ModelCurso(
            id: cursoSelect == null ? 0 : cursoSelect!.id,
            estado: "A",
            periodo: mesSelect,
            descripcion: ctrDescripcion.text,
            id_horario: horariosSelect!.id);
        existeCurso = await _datasource.postCursos(curso);
      }

      //
      if (existeCurso.id != 0) {
        for (var element in detalles) {
          element.idCab = existeCurso.id;
          element.idHorario = horariosSelect!.id;
          await _datasource.postCursosDet(element);
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
