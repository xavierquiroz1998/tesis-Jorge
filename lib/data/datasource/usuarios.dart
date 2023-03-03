import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/permisos.dart';
import 'package:tesis/data/model/usuarios.dart';

class UsuariosDatasurce {
  Future<List<ModelUsuarios>> cargarUsuarios() async {
    List<ModelUsuarios> lisTemp = [];
    try {
      String url = "${Url.urlBse}usuarios";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeUsuarios(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  Future<List<ModelPermisos>> getPermisosUsuarios(int idUsuario) async {
    List<ModelPermisos> lisTemp = [];
    try {
      String url = "${Url.urlBse}menu/permiso/$idUsuario";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodePermisos(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  Future<ModelUsuarios> postUsuarios(ModelUsuarios datos) async {
    var url = Uri.parse("${Url.urlBse}usuarios");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelUsuarios.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelUsuarios> postUpdateUsuarios(ModelUsuarios datos) async {
    var url = Uri.parse("${Url.urlBse}usuarios/update");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelUsuarios.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelUsuarios> postanularUsuarios(ModelUsuarios datos) async {
    var url = Uri.parse("${Url.urlBse}usuarios/anular");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelUsuarios.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelUsuarios> logeoUsuario(String usuario, String contr) async {
    var url = Uri.parse("${Url.urlBse}usuarios/login/$usuario/$contr");

    final resquet = await http.get(url);

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelUsuarios.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  List<ModelUsuarios> decodeUsuarios(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelUsuarios>((json) => ModelUsuarios.fromMap(json))
        .toList();
  }

  List<ModelPermisos> decodePermisos(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelPermisos>((json) => ModelPermisos.fromMap(json))
        .toList();
  }
}
