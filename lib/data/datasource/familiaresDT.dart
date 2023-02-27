import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/familiares.dart';

class FamiliaresDataSource {
  Future<List<ModelFamiliares>> getFamiliares() async {
    List<ModelFamiliares> lisTemp = [];
    try {
      String url = "${Url.urlBse}familiares";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeFamiliar(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<ModelFamiliares> postFamiliares(ModelFamiliares datos) async {
    var url = Uri.parse("${Url.urlBse}familiares");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelFamiliares.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }
  
  Future<ModelFamiliares> postActualizarFamiliares(ModelFamiliares datos) async {
    var url = Uri.parse("${Url.urlBse}familiares/aprobar");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelFamiliares.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  List<ModelFamiliares> decodeFamiliar(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelFamiliares>((json) => ModelFamiliares.fromMap(json))
        .toList();
  }
}
