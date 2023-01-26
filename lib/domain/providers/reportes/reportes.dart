import 'package:flutter/cupertino.dart';
import 'package:tesis/data/datasource/cita.dart';
import 'package:tesis/data/datasource/reporte.dart';
import 'package:tesis/data/model/cita.dart';
import 'package:tesis/data/model/reporte.dart';

class ReportesProvider extends ChangeNotifier {
  List<ModelReporte> listReportes = [];
  ReporteDatasurce _datasource = ReporteDatasurce();

  Future cargarReportes() async {
    try {
      var result = await _datasource.cargarReporte();
      listReportes = result;
      notifyListeners();
    } catch (e) {}
  }
}
