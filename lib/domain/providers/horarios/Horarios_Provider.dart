import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/disciplinas.dart';
import 'package:tesis/data/datasource/horarios.dart';
import 'package:tesis/data/model/catalogoModel.dart';
import 'package:tesis/data/model/disciplinaModel.dart';

class HorarioProvider extends ChangeNotifier {
  List<ModelCatalogos> listNivel = [];
  List<ModelCatalogos> listTiempo = [];
  List<ModelCatalogos> listCategoria = [];
  List<ModelCatalogos> listCiclo = [];

  List<ModelDisciplina> listDisciplina = [];

  ModelDisciplina infoDisciplina = ModelDisciplina();

  final HorariosDatasource _datasourceHorario = HorariosDatasource();
  final Disciplinas _datasourceDisciplina = Disciplinas();

  Future getCatalogos() async {
    try {
      listDisciplina = await _datasourceDisciplina.getDisciplinas();

      if (listDisciplina.isNotEmpty) {
        infoDisciplina = listDisciplina.firstOrDefault() ?? ModelDisciplina();
      }

      var lisTotal = await _datasourceHorario.getCatalogos();

      if (lisTotal.isNotEmpty) {
        listNivel = lisTotal.where((e) => e.idTipoCatalogo == 1).toList();
        listTiempo = lisTotal.where((e) => e.idTipoCatalogo == 2).toList();
        listCategoria = lisTotal.where((e) => e.idTipoCatalogo == 3).toList();
        listCiclo = lisTotal.where((e) => e.idTipoCatalogo == 4).toList();
      }
    } catch (e) {
      print("Erro al obtener catalogo ${e.toString()}");
    }
    notifyListeners();
  }
}
