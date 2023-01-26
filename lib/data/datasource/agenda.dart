import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/agenda.dart';

class AgendaDatasurce {
  Future<List<ModelAgenda>> cargarAgenda() async {
    List<ModelAgenda> lisTemp = [];
    try {
      String url = "${Url.urlBse}agenda";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeAgenda(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  List<ModelAgenda> decodeAgenda(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelAgenda>((json) => ModelAgenda.fromMap(json))
        .toList();
  }
}
