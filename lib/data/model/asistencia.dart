
import 'dart:convert';

class ModelAsistencia {
    ModelAsistencia({
        required this.idAsistencia,
        required this.fecha,
        required this.periodo,
        required this.idHorario,
        required this.descripcion,
        required this.estado,
    });

    int idAsistencia;
    DateTime fecha;
    String periodo;
    int idHorario;
    String descripcion;
    String estado;

    factory ModelAsistencia.fromJson(String str) => ModelAsistencia.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ModelAsistencia.fromMap(Map<String, dynamic> json) => ModelAsistencia(
        idAsistencia: json["id_asistencia"],
        fecha: DateTime.parse(json["fecha"]),
        periodo: json["periodo"],
        idHorario: json["id_horario"],
        descripcion: json["descripcion"],
        estado: json["estado"],
    );

    Map<String, dynamic> toMap() => {
        "id_asistencia": idAsistencia,
        "fecha": fecha.toIso8601String(),
        "periodo": periodo,
        "id_horario": idHorario,
        "descripcion": descripcion,
        "estado": estado,
    };
}



class ModelAsistenciaDet {
    ModelAsistenciaDet({
        required this.secuencia,
        required this.asistenciasCab,
        required this.idSocio,
        required this.asistencia,
        required this.falta,
        required this.retraso,
        required this.motivo,
    });

    int secuencia;
    int asistenciasCab;
    int idSocio;
    bool asistencia;
    bool falta;
    bool retraso;
    String motivo;

    factory ModelAsistenciaDet.fromJson(String str) => ModelAsistenciaDet.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ModelAsistenciaDet.fromMap(Map<String, dynamic> json) => ModelAsistenciaDet(
        secuencia: json["secuencia"],
        asistenciasCab: json["asistencias_cab"],
        idSocio: json["id_socio"],
        asistencia: json["asistencia"],
        falta: json["falta"],
        retraso: json["retraso"],
        motivo: json["motivo"],
    );

    Map<String, dynamic> toMap() => {
        "secuencia": secuencia,
        "asistencias_cab": asistenciasCab,
        "id_socio": idSocio,
        "asistencia": asistencia,
        "falta": falta,
        "retraso": retraso,
        "motivo": motivo,
    };
}
