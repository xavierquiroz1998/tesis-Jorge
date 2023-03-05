import 'dart:convert';

import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';

class ModelCursoDet {
  ModelCursoDet({
    required this.id,
    required this.idCab,
    required this.idSocio,
    required this.idHorario,
    socioSelect = null,
  });

  int id;
  int idCab;
  int idSocio;
  int idHorario;
  ModelFamiliares? socioSelect;

  factory ModelCursoDet.fromJson(String str) =>
      ModelCursoDet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelCursoDet.fromMap(Map<String, dynamic> json) => ModelCursoDet(
        id: json["id"],
        idCab: json["id_cab"],
        idSocio: json["id_socio"],
        idHorario: json["id_horario"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_cab": idCab,
        "id_socio": idSocio,
        "id_horario": idHorario,
      };
}
