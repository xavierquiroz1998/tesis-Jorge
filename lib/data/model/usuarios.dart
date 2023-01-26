// To parse this JSON data, do
//
//     final modelUsuarios = modelUsuariosFromMap(jsonString);

import 'dart:convert';

class ModelUsuarios {
  ModelUsuarios({
    this.id = 0,
    this.nombre = "",
    this.apellido = "",
    this.tipo = "",
    this.usuario = "",
    this.clave = "",
  });

  int id;
  String nombre;
  String apellido;
  String tipo;
  String usuario;
  String clave;

  factory ModelUsuarios.fromJson(String str) =>
      ModelUsuarios.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUsuarios.fromMap(Map<String, dynamic> json) => ModelUsuarios(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        tipo: json["tipo"],
        usuario: json["usuario"],
        clave: json["clave"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "tipo": tipo,
        "usuario": usuario,
        "clave": clave,
      };
}
