import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/turno.dart';

class TurnoDatasurce {
  Future<List<ModelTurno>> cargarTurno() async {
    List<ModelTurno> lisTemp = [];
    try {
      String url = "${Url.urlBse}turno";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeTurno(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  List<ModelTurno> decodeTurno(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo.map<ModelTurno>((json) => ModelTurno.fromMap(json)).toList();
  }
}
