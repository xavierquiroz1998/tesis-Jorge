import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/inscripcion.dart';

class InscripcionDataSource {
  Future<List<ModelIncripcion>> getInscripcion() async {
    List<ModelIncripcion> lisTemp = [];
    try {
      String url = "${Url.urlBse}inscripcion";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeInscripcion(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<List<ModelIncripcion>> getInscripcion_porUsuario(int usuario) async {
    List<ModelIncripcion> lisTemp = [];
    try {
      String url = "${Url.urlBse}inscripcion/$usuario";
      var temp = await http.get(Uri.parse(url));  

      if (temp.statusCode == 200) {
        lisTemp = decodeInscripcion(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<bool> postApiInscripcion(ModelIncripcion datos) async {
    var url = Uri.parse("${Url.urlBse}inscripcion");
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

  Future<bool> postAnularInscripcion(ModelIncripcion datos) async {
    var url = Uri.parse("${Url.urlBse}inscripcion/anular");
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

  Future<bool> postActualizarInscripcion(ModelIncripcion datos) async {
    var url = Uri.parse("${Url.urlBse}inscripcion/update");
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

  List<ModelIncripcion> decodeInscripcion(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelIncripcion>((json) => ModelIncripcion.fromMap(json))
        .toList();
  }
}
