import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/menu.dart';

class MenuDataSource {
  Future<List<ModelMenu>> getMenu() async {
    List<ModelMenu> lisTemp = [];
    try {
      String url = "${Url.urlBse}menu";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = _decodeMenu(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource menu $e");
      return [];
    }
  }

  Future<bool> postMenuUsuario(Modelmenu_x_usuario datos) async {
    var url = Uri.parse("${Url.urlBse}menu");
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

  List<ModelMenu> _decodeMenu(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo.map<ModelMenu>((json) => ModelMenu.fromMap(json)).toList();
  }
}
