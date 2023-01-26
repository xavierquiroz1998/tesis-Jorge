// To parse this JSON data, do
//
//     final modelEnfermera = modelEnfermeraFromMap(jsonString);

import 'dart:convert';

class ModelEnfermera {
  ModelEnfermera({
    this.idEnfermera = 0,
    this.nombre = "",
    this.apellido = "",
    this.estado = "",
  });

  int idEnfermera;
  String nombre;
  String apellido;
  dynamic estado;

  factory ModelEnfermera.fromJson(String str) =>
      ModelEnfermera.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelEnfermera.fromMap(Map<String, dynamic> json) => ModelEnfermera(
        idEnfermera: json["idEnfermera"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "idEnfermera": idEnfermera,
        "nombre": nombre,
        "apellido": apellido,
        "estado": estado,
      };
}
