// To parse this JSON data, do
//
//     final modelReporte = modelReporteFromMap(jsonString);

import 'dart:convert';

class ModelReporte {
  ModelReporte({
    this.idReporte = 0,
    this.idPaciente = 0,
    this.idEnfermera = 0,
    this.observacion = "",
  });

  int idReporte;
  int idPaciente;
  int idEnfermera;
  dynamic observacion;

  factory ModelReporte.fromJson(String str) =>
      ModelReporte.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelReporte.fromMap(Map<String, dynamic> json) => ModelReporte(
        idReporte: json["idReporte"],
        idPaciente: json["idPaciente"],
        idEnfermera: json["idEnfermera"],
        observacion: json["Observacion"],
      );

  Map<String, dynamic> toMap() => {
        "idReporte": idReporte,
        "idPaciente": idPaciente,
        "idEnfermera": idEnfermera,
        "Observacion": observacion,
      };
}
