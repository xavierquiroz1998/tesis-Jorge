import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/disciplinas.dart';
import 'package:tesis/data/datasource/horarios.dart';
import 'package:tesis/data/model/catalogoModel.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/horarios.dart';

class HorarioProvider extends ChangeNotifier {
  List<ModelCatalogos> listNivel = [];
  List<ModelCatalogos> listTiempo = [];
  List<ModelCatalogos> listCategoria = [];
  List<ModelCatalogos> listCiclo = [];
  List<ModelViewHorarios> lisHorarios = [];

  List<ModelDisciplina> listDisciplina = [];

  ModelDisciplina infoDisciplina = ModelDisciplina();
  ModelCatalogos infoNivel = ModelCatalogos();
  ModelCatalogos infoTiempo = ModelCatalogos();
  ModelCatalogos infoCategoria = ModelCatalogos();
  ModelCatalogos infoCiclo = ModelCatalogos();

  TextEditingController ctrHoraInicio = TextEditingController();
  TextEditingController ctrHoraFin = TextEditingController();
  TextEditingController ctrNivel = TextEditingController();
  TextEditingController ctrValor = TextEditingController();

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
      infoDisciplina = ModelDisciplina();
      infoNivel = ModelCatalogos();

      infoTiempo = ModelCatalogos();

      infoCategoria = ModelCatalogos();
      infoCiclo = ModelCatalogos();
    } catch (e) {
      print("Erro al obtener catalogo ${e.toString()}");
    }
    notifyListeners();
  }

  Future getHorarios() async {
    try {
      lisHorarios = await _datasourceHorario.getHorarios();
      notifyListeners();
    } catch (e) {}
  }
  
  Future getHorarios_x_profesor() async {
    try {
      lisHorarios = await _datasourceHorario.getHorarios_x_horairo();
      notifyListeners();
    } catch (e) {}
  }

  Future guardarHorario() async {
    try {
      ModelHorarios datos = ModelHorarios(
          id: 0,
          idDisciplina: infoDisciplina.id,
          nivel: ctrNivel.text,
          idCategoria: infoCategoria.id,
          estado: "A",
          idCiclo: infoCiclo.id,
          valor: double.parse(ctrValor.text),
          horario: ctrHoraInicio.text + "/" + ctrHoraFin.text);

      await _datasourceHorario.postApiHorario(datos);
    } catch (e) {}
  }
}