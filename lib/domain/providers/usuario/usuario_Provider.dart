import 'package:flutter/material.dart';
import 'package:tesis/data/datasource/menuDT.dart';
import 'package:tesis/data/datasource/usuarios.dart';
import 'package:tesis/data/model/menu.dart';
import 'package:tesis/data/model/usuarios.dart';

class UsuarioProvider extends ChangeNotifier {
  List<ModelMenu> listadoMenu = [];
  final MenuDataSource _dataSource = MenuDataSource();
  final UsuariosDatasurce _dataSourceUsuario = UsuariosDatasurce();

  TextEditingController ctrIdentificacion = TextEditingController();
  TextEditingController ctrUsuario = TextEditingController();
  TextEditingController ctrNombres = TextEditingController();
  TextEditingController ctrDomicilio = TextEditingController();
  TextEditingController ctrCorreo = TextEditingController();
  TextEditingController ctrCelular = TextEditingController();
  TextEditingController ctrContrasenia = TextEditingController();

  List<ModelUsuarios> listUsuario = [];

  ModelUsuarios? usuarioSelect;
  bool edit = false;

  Future getUsuarios() async {
    try {
      listUsuario = await _dataSourceUsuario.cargarUsuarios();
      notifyListeners();
    } catch (e) {}
  }

  Future getMenu() async {
    try {
      listadoMenu = await _dataSource.getMenu();
      if (edit) {
        ctrIdentificacion =
            TextEditingController(text: usuarioSelect!.identificacion);
        ctrUsuario = TextEditingController(text: usuarioSelect!.usuario);

        ctrNombres = TextEditingController(text: usuarioSelect!.nombres);

        ctrDomicilio = TextEditingController(text: usuarioSelect!.domicilio);
        ctrCorreo = TextEditingController(text: usuarioSelect!.correo);

        ctrCelular = TextEditingController(text: usuarioSelect!.celular);

        ctrContrasenia =
            TextEditingController(text: usuarioSelect!.contrasenia);
      } else {
        ctrIdentificacion = TextEditingController();
        ctrUsuario = TextEditingController();

        ctrNombres = TextEditingController();

        ctrDomicilio = TextEditingController();
        ctrCorreo = TextEditingController();

        ctrCelular = TextEditingController();

        ctrContrasenia = TextEditingController();
      }
      notifyListeners();
    } catch (e) {
      print("${e.toString()}");
    }
  }

  Future<bool> guardarUsuario() async {
    try {
      ModelUsuarios usuario = ModelUsuarios(
          id: 0,
          estado: "A",
          identificacion: ctrIdentificacion.text,
          usuario: ctrUsuario.text,
          nombres: ctrNombres.text,
          domicilio: ctrDomicilio.text,
          correo: ctrCorreo.text,
          celular: ctrCelular.text,
          contrasenia: ctrContrasenia.text);

      var result = await _dataSourceUsuario.postUsuarios(usuario);
      if (result.id != 0) {
        //
        for (var e in listadoMenu.where((element) => element.check).toList()) {
          Modelmenu_x_usuario permisos =
              Modelmenu_x_usuario(id: 0, id_menu: e.id, id_usuario: result.id);

          var resultado = await _dataSource.postMenuUsuario(permisos);
        }
      }

      await getUsuarios();

      return true;
    } catch (e) {
      print("${e.toString()}");
      return false;
    }
  }
}
