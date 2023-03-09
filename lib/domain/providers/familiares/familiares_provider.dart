import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/familiaresDT.dart';
import 'package:tesis/data/datasource/reference/local_storage.dart';
import 'package:tesis/data/model/familiares.dart';

class FamiliaresProvider extends ChangeNotifier {
  List<ModelFamiliares> listado = [];
  List<String> tipos = ["Socio", "Invitado"];
  String tipoSlect = "";
  String imagen = "";

  TextEditingController ctrIdentificacion = TextEditingController();
  TextEditingController ctrNombres = TextEditingController();
  TextEditingController ctrCodigoSocio = TextEditingController();
  TextEditingController ctrNombresSocio = TextEditingController();
  TextEditingController ctrCelular = TextEditingController();
  TextEditingController ctrCorreo = TextEditingController();
  TextEditingController ctrDomicilio = TextEditingController();
  //TextEditingController ctr = TextEditingController();

  FamiliaresDataSource _dataSource = FamiliaresDataSource();

  ModelFamiliares? familiarSelect;
  bool edit = false;

  Future getFamiliares() async {
    try {
      listado = await _dataSource.getFamiliares();
      notifyListeners();
    } catch (e) {}
  }

  Future getFamiliares_x_usuario() async {
    try {
      String? idUsuario = LocalStorage.prefs.getString('usuario');
      String? tipoUsuario = LocalStorage.prefs.getString('Tipousuario');
      if (idUsuario != null && tipoUsuario == "Socio") {
        listado =
            await _dataSource.getFamiliares_x_usuario(int.parse(idUsuario));
      } else {
        listado = await _dataSource.getFamiliares();
      }

      notifyListeners();
    } catch (e) {}
  }

  Future inicializacion() async {
    try {
      if (edit) {
        ctrIdentificacion =
            TextEditingController(text: familiarSelect!.identificacion);
        ctrNombres = TextEditingController(text: familiarSelect!.nombres);
        ctrCodigoSocio =
            TextEditingController(text: familiarSelect!.codigoSocio);
        ctrNombresSocio =
            TextEditingController(text: familiarSelect!.nombreSocio);
        ctrCelular = TextEditingController(text: familiarSelect!.celular);
        ctrCorreo = TextEditingController(text: familiarSelect!.correo);
        ctrDomicilio = TextEditingController(text: familiarSelect!.domicilio);

        tipoSlect = familiarSelect!.tipo;
      } else {
        ctrIdentificacion = TextEditingController();
        ctrNombres = TextEditingController();
        ctrCodigoSocio = TextEditingController();
        ctrNombresSocio = TextEditingController();
        ctrCelular = TextEditingController();
        ctrCorreo = TextEditingController();
        ctrDomicilio = TextEditingController();

        tipoSlect = "";
      }
    } catch (e) {}
  }

  Future<bool> garabar() async {
    try {
      String? idUsuario = LocalStorage.prefs.getString('usuario');
      if (idUsuario != null) {
        ModelFamiliares familiar = ModelFamiliares(
            id: familiarSelect == null ? 0 : familiarSelect!.id,
            identificacion: ctrIdentificacion.text,
            codigoSocio: ctrCodigoSocio.text,
            nombreSocio: ctrNombresSocio.text,
            nombres: ctrNombres.text,
            celular: ctrCelular.text,
            correo: ctrCorreo.text,
            domicilio: ctrDomicilio.text,
            fechaNac: DateTime.now(),
            estado: familiarSelect == null ? "PEN" : familiarSelect!.estado,
            idUsuario: int.parse(idUsuario),
            img: imagen,
            tipo: tipoSlect);
        if (edit) {
          await _dataSource.postUpdateFamiliares(familiar);
        } else {
          await _dataSource.postFamiliares(familiar);
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> anular() async {
    try {
      var ress = await _dataSource.postAnularFamiliares(familiarSelect!);
      if (ress.id != 0) {
        familiarSelect!.estado = "I";
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future aprobarFamiliares() async {
    try {
      for (var e in listado.where((element) => element.check).toList()) {
        await _dataSource.postActualizarFamiliares(e);
      }
      if (listado.where((element) => element.check).toList().isNotEmpty) {
        await getFamiliares();
      }
    } catch (e) {}
  }
}
