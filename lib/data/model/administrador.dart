// To parse this JSON data, do
//
//     final modelAdministrador = modelAdministradorFromMap(jsonString);

import 'dart:convert';

class ModelAdministrador {
  ModelAdministrador({
    this.idAministrador = 0,
    this.nombre = "",
    this.apellido = "",
  });

  int idAministrador;
  String nombre;
  String apellido;

  factory ModelAdministrador.fromJson(String str) =>
      ModelAdministrador.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelAdministrador.fromMap(Map<String, dynamic> json) =>
      ModelAdministrador(
        idAministrador: json["idAministrador"],
        nombre: json["nombre"],
        apellido: json["apellido"],
      );

  Map<String, dynamic> toMap() => {
        "idAministrador": idAministrador,
        "nombre": nombre,
        "apellido": apellido,
      };
}
