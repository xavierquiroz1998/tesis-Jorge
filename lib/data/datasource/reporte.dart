import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/reporte.dart';

class ReporteDatasurce {
  Future<List<ModelReporte>> cargarReporte() async {
    List<ModelReporte> lisTemp = [];
    try {
      String url = "${Url.urlBse}reporte";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeReporte(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  List<ModelReporte> decodeReporte(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelReporte>((json) => ModelReporte.fromMap(json))
        .toList();
  }
}
