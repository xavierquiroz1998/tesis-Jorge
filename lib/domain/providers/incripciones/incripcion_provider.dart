import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/cursoDt.dart';
import 'package:tesis/data/datasource/familiaresDT.dart';
import 'package:tesis/data/datasource/horarios.dart';
import 'package:tesis/data/datasource/inscripcionDT.dart';
import 'package:tesis/data/datasource/reference/local_storage.dart';
import 'package:tesis/data/model/curso.dart';
import 'package:tesis/data/model/cursoDet.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/data/model/inscripcion.dart';

class InscripcionProvider extends ChangeNotifier {
  TextEditingController ctrDescripcion = TextEditingController();
  ModelFamiliares? socioSelect;
  ModelViewHorarios? horariosSelect;
  List<ModelCursoDet> detalles = [];
  List<ModelIncripcion> lisIncripciones = [];
  List<ModelFamiliares> listadoFamiliares = [];
  List<ModelViewHorarios> lisHorarios = [];

  final CursoDataSource _datasource = CursoDataSource();
  final FamiliaresDataSource _dataSourceFamiliar = FamiliaresDataSource();
  final InscripcionDataSource _dataSourceInscripcion = InscripcionDataSource();

  final HorariosDatasource _datasourceHorario = HorariosDatasource();

  String mesSelect = "";
  List<String> listadoMeses = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre"
  ];

  ModelIncripcion? inscripcionSelect;
  bool edit = false;

  Future getFamiliares() async {
    try {
      String? idUsuario = LocalStorage.prefs.getString('usuario');
      String? tipoUsuario = LocalStorage.prefs.getString('Tipousuario');
      if (idUsuario != null && tipoUsuario == "Socio") {
        listadoFamiliares = await _dataSourceFamiliar
            .getFamiliares_x_usuario(int.parse(idUsuario));
      } else {
        listadoFamiliares = await _dataSourceFamiliar.getFamiliares();
      }
    } catch (e) {}
  }

  Future getHorarios() async {
    try {
      lisHorarios = await _datasourceHorario.getHorarios();
    } catch (e) {}
  }

  Future getInscripciones() async {
    try {
      String? idUsuario = LocalStorage.prefs.getString('usuario');
      String? tipoUsuario = LocalStorage.prefs.getString('Tipousuario');
      if (idUsuario != null && tipoUsuario == "Socio") {
        lisIncripciones = await _dataSourceInscripcion
            .getInscripcion_porUsuario(int.parse(idUsuario));
      } else {
        lisIncripciones = await _dataSourceInscripcion.getInscripcion();
      }

      notifyListeners();
    } catch (e) {}
  }

  Future inicilizar() async {
    try {
      if (edit) {
        mesSelect = inscripcionSelect!.periodo;
        ctrDescripcion =
            TextEditingController(text: inscripcionSelect!.descripcion);
        detalles = [];
        socioSelect = null;
        horariosSelect = null;

        var cursoDet = await _datasource.getCursosDet(inscripcionSelect!.id);

        await getFamiliares();
        await getHorarios();
        for (var element in cursoDet) {
          var obj1 =
              listadoFamiliares.firstWhere((e) => e.id == element.idSocio);
          if (obj1 != null) {
            element.socioSelect = obj1;
          }
        }
        detalles = cursoDet;
        notifyListeners();
      } else {
        mesSelect = "";
        ctrDescripcion = TextEditingController();
        detalles = [];
        socioSelect = null;
        horariosSelect = null;
      }
    } catch (e) {}
  }

  void agregarDetalle() {
    try {
      if (socioSelect != null && horariosSelect != null) {
        ModelCursoDet det = ModelCursoDet(
            id: 0, idCab: 0, idHorario: 0, idSocio: socioSelect!.id);
        det.socioSelect = socioSelect;
        //det.horariosSelect = horariosSelect;
        detalles.add(det);
        notifyListeners();
        socioSelect = null;
        //horariosSelect = null;
      }
    } catch (e) {}
  }

  Future<bool> guardar() async {
    try {
// primero que se cree la inscripcion y despues lo agrega al curso

      String? idUsuario = LocalStorage.prefs.getString('usuario');
      if (idUsuario != null) {
        ModelIncripcion insc = ModelIncripcion(
            id: inscripcionSelect == null ? 0 : inscripcionSelect!.id,
            estado: "A",
            descripcion: ctrDescripcion.text,
            idFamiliar: socioSelect!.id,
            idHorario: horariosSelect!.id,
            periodo: mesSelect,
            idUsuario: inscripcionSelect == null
                ? int.parse(idUsuario)
                : inscripcionSelect!.idUsuario);

        if (inscripcionSelect != null) {
          await _dataSourceInscripcion.postActualizarInscripcion(insc);
        } else {
          if (await _dataSourceInscripcion.postApiInscripcion(insc)) {
            var existeCurso =
                await _datasource.getExisteCurso(mesSelect, horariosSelect!.id);

            if (existeCurso == null) {
              ModelCurso curso = ModelCurso(
                  id: inscripcionSelect == null ? 0 : inscripcionSelect!.id,
                  estado: "A",
                  periodo: mesSelect,
                  descripcion: ctrDescripcion.text,
                  id_horario: horariosSelect!.id);
              existeCurso = await _datasource.postCursos(curso);
            }

            //
            if (existeCurso.id != 0) {
              ModelCursoDet det = ModelCursoDet(
                  id: 0,
                  idCab: existeCurso.id,
                  idHorario: horariosSelect!.id,
                  idSocio: socioSelect!.id);
              detalles.add(det);

              for (var element in detalles) {
                await _datasource.postCursosDet(element);
              }
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
      var result = await _dataSourceInscripcion
          .postAnularInscripcion(inscripcionSelect!);
      if (result) {
        inscripcionSelect!.estado = "I";
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
