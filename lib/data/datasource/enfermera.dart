import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/enfermera.dart';

class EnfermeraDatasurce {
  Future<List<ModelEnfermera>> cargarEnfermera() async {
    List<ModelEnfermera> lisTemp = [];
    try {
      String url = "${Url.urlBse}enfermera";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeEnfermera(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  List<ModelEnfermera> decodeEnfermera(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelEnfermera>((json) => ModelEnfermera.fromMap(json))
        .toList();
  }
}
