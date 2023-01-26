// To parse this JSON data, do
//
//     final modelCita = modelCitaFromMap(jsonString);

import 'dart:convert';

class ModelCita {
  ModelCita({
    this.id = 0,
    this.nombre = "",
    this.apellido = "",
    this.hora,
    this.fecha,
  });

  int id;
  String nombre;
  String apellido;
  DateTime? hora;
  DateTime? fecha;

  factory ModelCita.fromJson(String str) => ModelCita.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelCita.fromMap(Map<String, dynamic> json) {
    return ModelCita(
      id: json["id"] ?? 0,
      nombre: json["nombre"] ?? "",
      apellido: json["Apellido"] ?? "",
      hora: DateTime.parse(json["hora"] ?? DateTime.now().toIso8601String()),
      fecha: DateTime.parse(json["fecha"] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "Apellido": apellido,
        "hora": hora?.toIso8601String(),
        "fecha": fecha?.toIso8601String(),
      };
}
