import 'package:flutter/cupertino.dart';
import 'package:tesis/data/datasource/paciente.dart';
import 'package:tesis/data/model/paciente.dart';

class PacientesProvider extends ChangeNotifier {
  List<ModelPaciente> listEnfermeras = [];
  PacienteDatasurce _datasource = PacienteDatasurce();

  Future cargarPaciente() async {
    try {
      var result = await _datasource.cargarPaciente();
      listEnfermeras = result;
      notifyListeners();
    } catch (e) {}
  }
}
