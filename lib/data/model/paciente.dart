// To parse this JSON data, do
//
//     final modelPaciente = modelPacienteFromMap(jsonString);

import 'dart:convert';

class ModelPaciente {
  ModelPaciente({
    this.idPacinete = 0,
    this.nombre = "",
    this.apellido = "",
  });

  int idPacinete;
  String nombre;
  String apellido;

  factory ModelPaciente.fromJson(String str) =>
      ModelPaciente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelPaciente.fromMap(Map<String, dynamic> json) => ModelPaciente(
        idPacinete: json["idPacinete"],
        nombre: json["nombre"],
        apellido: json["Apellido"],
      );

  Map<String, dynamic> toMap() => {
        "idPacinete": idPacinete,
        "nombre": nombre,
        "Apellido": apellido,
      };
}
