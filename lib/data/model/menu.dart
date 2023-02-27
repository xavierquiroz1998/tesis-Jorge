import 'dart:convert';

class ModelMenu {
  ModelMenu({
    required this.id,
    required this.descripcion,
    required this.ruta,
    required this.estado,
    required this.icono,
    this.check = false,
  });

  int id;
  String descripcion;
  String ruta;
  String estado;
  String icono;
  bool check;

  factory ModelMenu.fromJson(String str) => ModelMenu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelMenu.fromMap(Map<String, dynamic> json) => ModelMenu(
        id: json["id"],
        descripcion: json["descripcion"],
        ruta: json["ruta"],
        estado: json["estado"],
        icono: json["icono"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "descripcion": descripcion,
        "ruta": ruta,
        "estado": estado,
        "icono": icono,
      };
}

class Modelmenu_x_usuario {
  Modelmenu_x_usuario({
    required this.id,
    required this.id_usuario,
    required this.id_menu,
  });
  int id;
  int id_usuario;
  int id_menu;

  factory Modelmenu_x_usuario.fromJson(String str) =>
      Modelmenu_x_usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Modelmenu_x_usuario.fromMap(Map<String, dynamic> json) =>
      Modelmenu_x_usuario(
        id: json["id"],
        id_usuario: json["id_usuario"],
        id_menu: json["id_menu"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_usuario": id_usuario,
        "id_menu": id_menu,
      };
}
