// To parse this JSON data, do
//
//     final modelCurso = modelCursoFromMap(jsonString);

import 'dart:convert';

import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';

class ModelCurso {
  ModelCurso({
    required this.id,
    required this.descripcion,
    required this.periodo,
    required this.estado,
  });

  int id;
  String descripcion;
  String periodo;
  String estado;

  factory ModelCurso.fromJson(String str) =>
      ModelCurso.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelCurso.fromMap(Map<String, dynamic> json) => ModelCurso(
        id: json["id"],
        descripcion: json["descripcion"],
        periodo: json["periodo"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "descripcion": descripcion,
        "periodo": periodo,
        "estado": estado,
      };
}
