import 'package:flutter/cupertino.dart';
import 'package:tesis/data/datasource/administrador.dart';

class ReportProvider extends ChangeNotifier {
  void cargarEmfermeras() async {
    try {
      AdministradorDatasurce data = AdministradorDatasurce();
      var temp = await data.cargarAdminitrador();
    } catch (e) {}
  }

  static of(BuildContext context, {required bool listen}) {}
}
