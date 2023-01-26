import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/cita.dart';

class CitaDatasurce {
  Future<List<ModelCita>> cargarCita() async {
    List<ModelCita> lisTemp = [];
    try {
      String url = "${Url.urlBse}cita";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeCita(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  List<ModelCita> decodeCita(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo.map<ModelCita>((json) => ModelCita.fromMap(json)).toList();
  }
}
