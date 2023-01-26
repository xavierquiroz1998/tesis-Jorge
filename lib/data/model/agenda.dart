// To parse this JSON data, do
//
//     final modelAgenda = modelAgendaFromMap(jsonString);

import 'dart:convert';

class ModelAgenda {
  ModelAgenda({
    this.idAgenda = 0,
    this.idCita = 0,
    this.idTurno = 0,
  });

  int idAgenda;
  int idCita;
  int idTurno;

  factory ModelAgenda.fromJson(String str) =>
      ModelAgenda.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelAgenda.fromMap(Map<String, dynamic> json) => ModelAgenda(
        idAgenda: json["idAgenda"],
        idCita: json["idCita"],
        idTurno: json["idTurno"],
      );

  Map<String, dynamic> toMap() => {
        "idAgenda": idAgenda,
        "idCita": idCita,
        "idTurno": idTurno,
      };
}
