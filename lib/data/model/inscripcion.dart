import 'dart:convert';

class ModelIncripcion {
  ModelIncripcion({
    required this.id,
    required this.descripcion,
    required this.periodo,
    required this.estado,
    required this.idHorario,
    required this.idFamiliar,
    required this.idUsuario,
  });

  int id;
  String descripcion;
  String periodo;
  String estado;
  int idHorario;
  int idFamiliar;
  int idUsuario;

  factory ModelIncripcion.fromJson(String str) =>
      ModelIncripcion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelIncripcion.fromMap(Map<String, dynamic> json) => ModelIncripcion(
        id: json["id"],
        descripcion: json["descripcion"],
        periodo: json["periodo"],
        estado: json["estado"],
        idHorario: json["id_horario"],
        idFamiliar: json["id_familiar"],
        idUsuario: json["id_usuario"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "descripcion": descripcion,
        "periodo": periodo,
        "estado": estado,
        "id_horario": idHorario,
        "id_familiar": idFamiliar,
        "id_usuario": idUsuario,
      };
}
