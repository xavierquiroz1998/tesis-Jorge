import 'package:flutter/cupertino.dart';
import 'package:tesis/data/datasource/cita.dart';
import 'package:tesis/data/model/cita.dart';

class CitaProvider extends ChangeNotifier {
  List<ModelCita> listCita = [];
  CitaDatasurce _datasource = CitaDatasurce();

  Future cargarCita() async {
    try {
      var result = await _datasource.cargarCita();
      listCita = result;
      notifyListeners();
    } catch (e) {}
  }
}
