import 'package:flutter/cupertino.dart';

class IngresoReporteProvider extends ChangeNotifier {
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerCedula = TextEditingController();
  TextEditingController controllerObservacion = TextEditingController();
  String accion = "";

  List<Paciente> listadoPAcientes = [];
  //yaaaaaa
  void guardar() {
    try {
      print("Guardar");
      var pacienteTemp = Paciente();
      pacienteTemp.nombre = controllerNombre.text;
      pacienteTemp.apellido = controllerApellido.text;
      pacienteTemp.cedula = controllerCedula.text;
      pacienteTemp.observacion = controllerObservacion.text;
      listadoPAcientes.add(pacienteTemp);
      accion = "Guardado";
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void modificar() {
    try {
      accion = "modificar";
      print("modificado correctamente");
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void eliminar() {
    try {
      accion = "eliminar";
      print("eliminado correctamente");
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

class Paciente {
  String nombre = "";
  String apellido = "";
  String cedula = "";
  String observacion = "";

  Paciente();
}
