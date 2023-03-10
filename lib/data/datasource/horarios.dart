import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/catalogoModel.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/data/model/profesor.dart';

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

  Future<List<ModelViewHorarios>> getHorarios() async {
    List<ModelViewHorarios> lisTemp = [];
    try {
      String url = "${Url.urlBse}horarios";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeViewHorarios(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<List<ModelViewHorarios>> getHorarios_x_disciplina(
      int idDisciplina) async {
    List<ModelViewHorarios> lisTemp = [];
    try {
      String url = "${Url.urlBse}horarios/disciplina/$idDisciplina";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeViewHorarios(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<ModelProfesor?> getProfesor_x_horario(int idHorario) async {
    try {
      String url = "${Url.urlBse}horarios/horario/$idHorario";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        return ModelProfesor.fromMap(jsonDecode(temp.body));
      }
      return null;
    } catch (e) {
      print("Error en dataource horaios $e");
      return null;
    }
  }

  Future<List<ModelViewHorarios>> getHorarios_x_horairo() async {
    List<ModelViewHorarios> lisTemp = [];
    try {
      String url = "${Url.urlBse}horarios/Xprofesor";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeViewHorarios(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<bool> postApiHorario(ModelHorarios datos) async {
    var url = Uri.parse("${Url.urlBse}horarios");
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

  Future<bool> postAnularHorario(ModelHorarios datos) async {
    var url = Uri.parse("${Url.urlBse}horarios/anular");
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

  Future<bool> postActualizarHorario(ModelHorarios datos) async {
    var url = Uri.parse("${Url.urlBse}horarios/update");
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

  List<ModelHorarios> decodeHorarios(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelHorarios>((json) => ModelHorarios.fromMap(json))
        .toList();
  }

  List<ModelViewHorarios> decodeViewHorarios(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelViewHorarios>((json) => ModelViewHorarios.fromMap(json))
        .toList();
  }

  List<ModelProfesor> decodeProfesor(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelProfesor>((json) => ModelProfesor.fromMap(json))
        .toList();
  }
}
