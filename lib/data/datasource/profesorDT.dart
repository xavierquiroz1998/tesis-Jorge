import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tesis/data/datasource/reference/URLbase.dart';
import 'package:tesis/data/model/profesor.dart';

class ProfesorDataSource {
  Future<List<ModelProfesor>> getProfesor() async {
    List<ModelProfesor> lisTemp = [];
    try {
      String url = "${Url.urlBse}profesor";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeProfesor(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<List<ModelProfesorXHorario>> getProfesorHorarios(
      int idProfesor) async {
    List<ModelProfesorXHorario> lisTemp = [];
    try {
      String url = "${Url.urlBse}profesor/xHorario/$idProfesor";
      var temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        lisTemp = decodeProfesorHorario(utf8.decode(temp.bodyBytes));
      }
      return lisTemp;
    } catch (e) {
      print("Error en dataource horaios $e");
      return [];
    }
  }

  Future<ModelProfesor> postProfesor(ModelProfesor datos) async {
    var url = Uri.parse("${Url.urlBse}profesor");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelProfesor.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelProfesor> postActualizarProfesor(ModelProfesor datos) async {
    var url = Uri.parse("${Url.urlBse}profesor/update");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelProfesor.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<ModelProfesor> postAnularProfesor(ModelProfesor datos) async {
    var url = Uri.parse("${Url.urlBse}profesor/anular");
    var data = datos.toJson();

    final resquet = await http.post(url,
        body: data,
        headers: {"Content-type": "application/json;charset=UTF-8"});

    try {
      if (resquet.statusCode != 200) {
        throw Exception('${resquet.statusCode}');
      } else {
        return ModelProfesor.fromMap(jsonDecode(resquet.body));
      }
    } catch (e) {
      throw ('$e');
    }
  }

  Future<bool> postProfesor_x_horario(ModelProfesorXHorario datos) async {
    var url = Uri.parse("${Url.urlBse}profesor/xHorario");
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

  Future<bool> eliminarpostProfesor_x_horario(ModelProfesor datos) async {
    var url = Uri.parse("${Url.urlBse}profesor/delete");
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

  List<ModelProfesor> decodeProfesor(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelProfesor>((json) => ModelProfesor.fromMap(json))
        .toList();
  }

  List<ModelProfesorXHorario> decodeProfesorHorario(String respuesta) {
    var parseo = jsonDecode(respuesta);
    return parseo
        .map<ModelProfesorXHorario>(
            (json) => ModelProfesorXHorario.fromMap(json))
        .toList();
  }
}
