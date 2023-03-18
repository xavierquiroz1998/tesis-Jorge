import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/cursoDt.dart';
import 'package:tesis/data/datasource/disciplinas.dart';
import 'package:tesis/data/datasource/horarios.dart';
import 'package:tesis/data/model/curso.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/data/model/profesor.dart';

class CurosProvider extends ChangeNotifier {
  List<ModelDisciplina> listDisciplina = [];
  List<ModelViewHorarios> lisHorarios = [];
  List<ModelCurso> lisCursos = [];
  ModelProfesor? profesor;

  ModelDisciplina? disciplinaSlect;

  final Disciplinas _datasourceDisciplina = Disciplinas();
  final CursoDataSource _datasource = CursoDataSource();
  final HorariosDatasource _datasourceHorario = HorariosDatasource();

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
}
