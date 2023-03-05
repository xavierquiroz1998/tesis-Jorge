import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/asistencia.dart';
import 'package:tesis/data/model/viewAsistencia.dart';

class AsistenciaDataSource {
  Future<List<ModelViewAsistencia>> cargarCita(
      String periodo, int disciplina) async {
    List<ModelViewAsistencia> lisTemp = [];
    try {
      String url = "${Url.urlBse}asistencia/$periodo/$disciplina";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeView(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  Future<List<ModelAsistencia>> getAsistencias() async {
    List<ModelAsistencia> lisTemp = [];
    try {
      String url = "${Url.urlBse}asistencia";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeAsistencias(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("$e");
      return [];
    }
  }

  Future<ModelAsistencia> postAsistencias(ModelAsistencia datos) async {
    var url = Uri.parse("${Url.urlBse}asistencia");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelAsistencia.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }
  Future<ModelAsistencia> postAnular(ModelAsistencia datos) async {
    var url = Uri.parse("${Url.urlBse}asistencia/anular");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelAsistencia.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelAsistenciaDet> postAsistenciasDet(
      ModelAsistenciaDet datos) async {
    var url = Uri.parse("${Url.urlBse}asistencia/det");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelAsistenciaDet.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  List<ModelViewAsistencia> decodeView(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelViewAsistencia>((json) => ModelViewAsistencia.fromMap(json))
        .toList();
  }

  List<ModelAsistencia> decodeAsistencias(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelAsistencia>((json) => ModelAsistencia.fromMap(json))
        .toList();
  }
}
