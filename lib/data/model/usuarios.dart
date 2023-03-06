import 'dart:convert';

class ModelUsuarios {
  ModelUsuarios({
    required this.id,
    required this.usuario,
    required this.nombres,
    required this.identificacion,
    required this.domicilio,
    required this.correo,
    required this.celular,
    required this.contrasenia,
    required this.estado,
    required this.tipo_usuario,
  });

  int id;
  String usuario;
  String nombres;
  String identificacion;
  String domicilio;
  String correo;
  String celular;
  String contrasenia;
  String estado;
  String tipo_usuario;

  factory ModelUsuarios.fromJson(String str) =>
      ModelUsuarios.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUsuarios.fromMap(Map<String, dynamic> json) => ModelUsuarios(
        id: json["id"],
        usuario: json["usuario"],
        nombres: json["nombres"],
        identificacion: json["identificacion"],
        domicilio: json["domicilio"],
        correo: json["correo"],
        celular: json["celular"],
        contrasenia: json["contrasenia"],
        estado: json["estado"],
        tipo_usuario: json["tipo_usuario"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "usuario": usuario,
        "nombres": nombres,
        "identificacion": identificacion,
        "domicilio": domicilio,
        "correo": correo,
        "celular": celular,
        "contrasenia": contrasenia,
        "estado": estado,
        "tipo_usuario": tipo_usuario,
      };
}
