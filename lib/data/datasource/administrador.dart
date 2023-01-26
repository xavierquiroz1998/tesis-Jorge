import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/administrador.dart';

class AdministradorDatasurce {
  Future<List<ModelAdministrador>> cargarAdminitrador() async {
    List<ModelAdministrador> lisTemp = [];
    try {
      String url = "${Url.urlBse}administrador";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeAdmini(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  List<ModelAdministrador> decodeAdmini(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelAdministrador>((json) => ModelAdministrador.fromMap(json))
        .toList();
  }
}
