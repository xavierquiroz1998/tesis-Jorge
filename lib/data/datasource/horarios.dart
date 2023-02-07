import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/catalogoModel.dart';

class HorariosDatasource {
  Future<List<ModelCatalogos>> getCatalogos() async {
    List<ModelCatalogos> lisTemp = [];
    try {
      String url = "${Url.urlBse}catalogos";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeCatalogo(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  List<ModelCatalogos> decodeCatalogo(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelCatalogos>((json) => ModelCatalogos.fromMap(json))
        .toList();
  }
}
