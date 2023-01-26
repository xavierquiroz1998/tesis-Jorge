import 'package:flutter/cupertino.dart';
import 'package:tesis/data/datasource/enfermera.dart';
import 'package:tesis/data/model/enfermera.dart';

class EnfermerProvider extends ChangeNotifier {
  List<ModelEnfermera> listEnfermeras = [];
  EnfermeraDatasurce _datasource = EnfermeraDatasurce();

  Future cargarEnfermeras() async {
    try {
      var result = await _datasource.cargarEnfermera();
      listEnfermeras = result;
      notifyListeners();
    } catch (e) {}
  }
}
