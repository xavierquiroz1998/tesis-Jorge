// To parse this JSON data, do
//
//     final modelTurno = modelTurnoFromMap(jsonString);

import 'dart:convert';

class ModelTurno {
  ModelTurno({
    this.idTurno = 0,
    this.descripcion = "",
    this.dia,
  });

  int idTurno;
  String descripcion;
  DateTime? dia;

  factory ModelTurno.fromJson(String str) =>
      ModelTurno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelTurno.fromMap(Map<String, dynamic> json) => ModelTurno(
        idTurno: json["idTurno"],
        descripcion: json["descripcion"],
        dia: DateTime.parse(json["dia"]),
      );

  Map<String, dynamic> toMap() => {
        "idTurno": idTurno,
        "descripcion": descripcion,
        "dia": dia?.toIso8601String(),
      };
}
