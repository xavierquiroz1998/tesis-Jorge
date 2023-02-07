import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/disciplinas.dart';
import 'package:tesis/data/model/disciplinaModel.dart';

class DisciplinaProvider extends ChangeNotifier {
  List<ModelDisciplina> listado = [];
  Disciplinas dataSource = Disciplinas();

  bool _estado = false;

  bool get estado => _estado;

  set estado(bool value) {
    _estado = value;
  }

  Future getDisciplinas() async {
    try {
      listado = await dataSource.getDisciplinas();
    } catch (e) {}
    notifyListeners();
  }

  changeState(bool value) {
    estado = value;
    notifyListeners();
  }
}
