import 'dart:convert';

class ModelPermisos {
  ModelPermisos({
    required this.idUsuario,
    required this.descripcion,
    required this.ruta,
    required this.estado,
    required this.icono,
  });

  int idUsuario;
  String descripcion;
  String ruta;
  String estado;
  String icono;

  factory ModelPermisos.fromJson(String str) =>
      ModelPermisos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelPermisos.fromMap(Map<String, dynamic> json) => ModelPermisos(
        idUsuario: json["id_usuario"],
        descripcion: json["descripcion"],
        ruta: json["ruta"],
        estado: json["estado"],
        icono: json["icono"],
      );

  Map<String, dynamic> toMap() => {
        "id_usuario": idUsuario,
        "descripcion": descripcion,
        "ruta": ruta,
        "estado": estado,
        "icono": icono,
      };
}
