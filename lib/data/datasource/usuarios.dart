import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
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

  List<ModelUsuarios> decodeUsuarios(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelUsuarios>((json) => ModelUsuarios.fromMap(json))
        .toList();
  }
}
