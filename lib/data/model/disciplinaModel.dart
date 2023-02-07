

// To parse this JSON data, do
//
//     final modelDisciplina = modelDisciplinaFromMap(jsonString);

import 'dart:convert';

class ModelDisciplina {
    ModelDisciplina({
        this.id = 0,
        this.codigo ="",
        this.descripcion = "",
        this.estado = "",
    });

    int id;
    String codigo;
    String descripcion;
    String estado;

    factory ModelDisciplina.fromJson(String str) => ModelDisciplina.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ModelDisciplina.fromMap(Map<String, dynamic> json) => ModelDisciplina(
        id: json["id"],
        codigo: json["codigo"],
        descripcion: json["descripcion"],
        estado: json["estado"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "codigo": codigo,
        "descripcion": descripcion,
        "estado": estado,
    };
}
