import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/disciplinas.dart';
import 'package:tesis/data/model/disciplinaModel.dart';

class DisciplinaProvider extends ChangeNotifier {
  List<ModelDisciplina> listado = [];
  Disciplinas _dataSource = Disciplinas();

  TextEditingController ctrCodigo = TextEditingController();
  TextEditingController ctrDescripcion = TextEditingController();

  ModelDisciplina? disciplina;

  bool _estado = false;

  bool get estado => _estado;

  set estado(bool value) {
    _estado = value;
  }

  Future getDisciplinas() async {
    try {
      listado = [];
      listado = await _dataSource.getDisciplinas();
      notifyListeners();
    } catch (e) {}
  }

  changeState(bool value) {
    estado = value;
    notifyListeners();
  }

  void setDisciplina() {
    try {
      ctrCodigo = TextEditingController(text: disciplina!.codigo);
      ctrDescripcion = TextEditingController(text: disciplina!.descripcion);
      notifyListeners();
    } catch (e) {}
  }

  Future<bool> guardar() async {
    try {
      bool result = false;

      if (disciplina != null) {
        disciplina!.codigo = ctrCodigo.text;
        disciplina!.descripcion = ctrDescripcion.text;

        result = await _dataSource.postactualizaDisciplina(disciplina!);
      } else {
        ModelDisciplina d = ModelDisciplina(
            id: 0,
            estado: "A",
            codigo: ctrCodigo.text,
            descripcion: ctrDescripcion.text);

        result = await _dataSource.postDisciplina(d);
      }

      if (result) {
        await getDisciplinas();
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> anular() async {
    try {
      var result = await _dataSource.postAnularDisciplina(disciplina!);

      if (result) {
        disciplina!.estado = "I";
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
