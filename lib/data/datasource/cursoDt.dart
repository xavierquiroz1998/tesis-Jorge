import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/curso.dart';
import 'package:tesis/data/model/cursoDet.dart';

class CursoDataSource {
  Future<List<ModelCurso>> getCursos() async {
    List<ModelCurso> lisTemp = [];
    try {
      String url = "${Url.urlBse}cursos";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = _decodeCurso(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<List<ModelCursoDet>> getCursosDet(int idCab) async {
    List<ModelCursoDet> lisTemp = [];
    try {
      String url = "${Url.urlBse}cursos/det/$idCab";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = _decodeCursoDet(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<ModelCurso> postCursos(ModelCurso datos) async {
    var url = Uri.parse("${Url.urlBse}cursos");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelCurso.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelCurso> postActualizarCursos(ModelCurso datos) async {
    var url = Uri.parse("${Url.urlBse}cursos/update");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelCurso.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelCurso> postAnularCursos(ModelCurso datos) async {
    var url = Uri.parse("${Url.urlBse}cursos/anular");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelCurso.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelCursoDet> postCursosDet(ModelCursoDet datos) async {
    var url = Uri.parse("${Url.urlBse}cursos/det");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelCursoDet.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  List<ModelCurso> _decodeCurso(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo.map<ModelCurso>((json) => ModelCurso.fromMap(json)).toList();
  }

  List<ModelCursoDet> _decodeCursoDet(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelCursoDet>((json) => ModelCursoDet.fromMap(json))
        .toList();
  }
}
