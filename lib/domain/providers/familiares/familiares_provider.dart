import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/familiaresDT.dart';
import 'package:tesis/data/model/familiares.dart';

class FamiliaresProvider extends ChangeNotifier {
  List<ModelFamiliares> listado = [];
  List<String> tipos = ["Socio", "Invitado"];
  String tipoSlect = "";

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

  Future garabar() async {
    try {
      ModelFamiliares familiar = ModelFamiliares(
          id: 0,
          identificacion: ctrIdentificacion.text,
          codigoSocio: ctrCodigoSocio.text,
          nombreSocio: ctrNombresSocio.text,
          nombres: ctrNombres.text,
          celular: ctrCelular.text,
          correo: ctrCorreo.text,
          domicilio: ctrDomicilio.text,
          fechaNac: DateTime.now(),
          estado: "PEN",
          tipo: tipoSlect);

      await _dataSource.postFamiliares(familiar);
    } catch (e) {}
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
