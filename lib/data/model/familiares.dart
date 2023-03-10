import 'dart:convert';

class ModelFamiliares {
  ModelFamiliares({
    required this.id,
    required this.codigoSocio,
    required this.nombreSocio,
    required this.identificacion,
    required this.nombres,
    required this.tipo,
    required this.celular,
    required this.correo,
    required this.domicilio,
    required this.fechaNac,
    required this.estado,
    required this.idUsuario,
    required this.img,
    this.check = false,
  });

  int id;
  String codigoSocio;
  String nombreSocio;
  String identificacion;
  String nombres;
  String tipo;
  String celular;
  String correo;
  String domicilio;
  DateTime fechaNac;
  String estado;
  int idUsuario;
  bool check;
  String img;

  factory ModelFamiliares.fromJson(String str) =>
      ModelFamiliares.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelFamiliares.fromMap(Map<String, dynamic> json) => ModelFamiliares(
        id: json["id"],
        codigoSocio: json["codigo_socio"],
        nombreSocio: json["nombre_socio"],
        identificacion: json["identificacion"],
        nombres: json["nombres"],
        tipo: json["tipo"],
        celular: json["celular"],
        correo: json["correo"],
        domicilio: json["domicilio"],
        fechaNac: DateTime.parse(json["fecha_nac"]),
        estado: json["estado"],
        idUsuario: json["id_usuario"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "codigo_socio": codigoSocio,
        "nombre_socio": nombreSocio,
        "identificacion": identificacion,
        "nombres": nombres,
        "tipo": tipo,
        "celular": celular,
        "correo": correo,
        "domicilio": domicilio,
        "fecha_nac": fechaNac.toIso8601String(),
        "estado": estado,
        "id_usuario": idUsuario,
        "img": img,
      };
}
