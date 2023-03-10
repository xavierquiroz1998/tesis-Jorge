import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/horarios.dart';
import 'package:tesis/data/datasource/profesorDT.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/data/model/profesor.dart';

class ProfesorProvider extends ChangeNotifier {
  List<ModelProfesor> listProfesores = [];
  List<ModelViewHorarios> lisHorarios = [];
  List<ModelProfesorXHorario> listProfesorHorario = [];

  final ProfesorDataSource _dataSource = ProfesorDataSource();
  final HorariosDatasource _datasourceHorario = HorariosDatasource();

  TextEditingController ctrIdentificacion = TextEditingController();
  TextEditingController ctrNombres = TextEditingController();
  TextEditingController ctrApellidos = TextEditingController();
  TextEditingController ctrCelular = TextEditingController();
  TextEditingController ctrDomicilio = TextEditingController();
  TextEditingController ctrCorreo = TextEditingController();

  ModelProfesor? profeSelect;
  bool edit = false;

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

  Future getProfesores() async {
    try {
      listProfesores = await _dataSource.getProfesor();
      notifyListeners();
    } catch (e) {}
  }

  Future getProfesoresHorarios(int idproveedor) async {
    try {
      listProfesorHorario = await _dataSource.getProfesorHorarios(idproveedor);
      notifyListeners();
    } catch (e) {}
  }

  inicializacion() async {
    if (edit) {
      ctrIdentificacion =
          TextEditingController(text: profeSelect!.identificacion);
      ctrNombres = TextEditingController(text: profeSelect!.nombres);

      ctrApellidos = TextEditingController(text: profeSelect!.apellidos);
      ctrCelular = TextEditingController(text: profeSelect!.celular);

      ctrDomicilio = TextEditingController(text: profeSelect!.domicilio);
      ctrCorreo = TextEditingController(text: profeSelect!.correo);
      await getHorarios();

      await getProfesoresHorarios(profeSelect!.id);
      for (var element in lisHorarios) {
        for (var element2 in listProfesorHorario) {
          if (element.id == element2.idHorario) {
            element.check = true;
          }
        }
      }
    } else {
      ctrIdentificacion = TextEditingController();
      ctrNombres = TextEditingController();

      ctrApellidos = TextEditingController();
      ctrCelular = TextEditingController();

      ctrDomicilio = TextEditingController();
      ctrCorreo = TextEditingController();
      await getHorarios_x_profesor();
    }
    notifyListeners();
  }

  Future<bool> guardar(List<ModelViewHorarios> cursosAsigandos) async {
    try {
      ModelProfesor profesor = ModelProfesor(
          id: profeSelect == null ? 0 : profeSelect!.id,
          nombres: ctrNombres.text,
          apellidos: ctrApellidos.text,
          celular: ctrCelular.text,
          correo: ctrCorreo.text,
          domicilio: ctrDomicilio.text,
          estado: "A",
          identificacion: ctrIdentificacion.text);

      if (edit) {
        var resultProfe = await _dataSource.postActualizarProfesor(profesor);

        if (resultProfe.id != 0) {
          if (cursosAsigandos.isNotEmpty) {
            if (await _dataSource.eliminarpostProfesor_x_horario(resultProfe)) {
              for (var item in cursosAsigandos) {
                ModelProfesorXHorario horarioProfe = ModelProfesorXHorario(
                    id: 0, idProfesor: resultProfe.id, idHorario: item.id);

                await _dataSource.postProfesor_x_horario(horarioProfe);
              }
            }
          }
        }
      } else {
        var resultProfe = await _dataSource.postProfesor(profesor);

        if (resultProfe.id != 0) {
          if (cursosAsigandos.isNotEmpty) {
            for (var item in cursosAsigandos) {
              ModelProfesorXHorario horarioProfe = ModelProfesorXHorario(
                  id: 0, idProfesor: resultProfe.id, idHorario: item.id);

              await _dataSource.postProfesor_x_horario(horarioProfe);
            }
          }
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> anular() async {
    try {
      var resultProfe = await _dataSource.postAnularProfesor(profeSelect!);
      if (resultProfe.id != 0) {
        profeSelect!.estado = "I";
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
