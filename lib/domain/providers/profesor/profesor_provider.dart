import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/profesorDT.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/data/model/profesor.dart';

class ProfesorProvider extends ChangeNotifier {
  List<ModelProfesor> listProfesores = [];

  ProfesorDataSource _dataSource = ProfesorDataSource();

  TextEditingController ctrIdentificacion = TextEditingController();
  TextEditingController ctrNombres = TextEditingController();
  TextEditingController ctrApellidos = TextEditingController();
  TextEditingController ctrCelular = TextEditingController();
  TextEditingController ctrDomicilio = TextEditingController();
  TextEditingController ctrCorreo = TextEditingController();

  Future getProfesores() async {
    try {
      listProfesores = await _dataSource.getProfesor();
      notifyListeners();
    } catch (e) {}
  }

  inicializacion() {
    ctrIdentificacion = TextEditingController();
    ctrNombres = TextEditingController();

    ctrApellidos = TextEditingController();
    ctrCelular = TextEditingController();

    ctrDomicilio = TextEditingController();
    ctrCorreo = TextEditingController();
  }

  Future guardar(List<ModelViewHorarios> cursosAsigandos) async {
    try {
      ModelProfesor profesor = ModelProfesor(
          id: 0,
          nombres: ctrNombres.text,
          apellidos: ctrApellidos.text,
          celular: ctrCelular.text,
          correo: ctrCorreo.text,
          domicilio: ctrDomicilio.text,
          estado: "A",
          identificacion: ctrIdentificacion.text);

      bool result = await _dataSource.postProfesor(profesor);

      if (cursosAsigandos.isNotEmpty) {
        for (var item in cursosAsigandos) {
          
        }
      }
    } catch (e) {}
  }
}
