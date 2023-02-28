import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/disciplinaModel.dart';

class Disciplinas {
  Future<List<ModelDisciplina>> getDisciplinas() async {
    List<ModelDisciplina> lisTemp = [];
    try {
      String url = "${Url.urlBse}Disciplinas";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeDisciplina(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  Future<bool> postDisciplina(ModelDisciplina datos) async {
    var url = Uri.parse("${Url.urlBse}Disciplinas");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return true;
      }
    } catch (e) {
      throw ('$e');
    }
  }

  List<ModelDisciplina> decodeDisciplina(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelDisciplina>((json) => ModelDisciplina.fromMap(json))
        .toList();
  }
}
