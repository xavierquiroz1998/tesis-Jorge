import 'dart:convert';

class ModelCatalogos {
  ModelCatalogos({
    this.id = 0,
    this.idTipoCatalogo = 0,
    this.descripcion = '',
    this.estado = '',
  });

  int id;
  int idTipoCatalogo;
  String descripcion;
  String estado;

  factory ModelCatalogos.fromJson(String str) =>
      ModelCatalogos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelCatalogos.fromMap(Map<String, dynamic> json) => ModelCatalogos(
        id: json["id"],
        idTipoCatalogo: json["id_tipo_catalogo"],
        descripcion: json["descripcion"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_tipo_catalogo": idTipoCatalogo,
        "descripcion": descripcion,
        "estado": estado,
      };
}
