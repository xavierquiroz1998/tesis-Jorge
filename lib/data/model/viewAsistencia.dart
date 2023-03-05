import 'dart:convert';

class ModelViewAsistencia {
  ModelViewAsistencia({
    required this.idcurso,
    required this.descripcionCurso,
    required this.periodo,
    required this.idHorario,
    required this.idDisciplina,
    required this.codigo,
    required this.disciplinaDescripcion,
    required this.nivel,
    required this.horario,
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
    this.asistencia = false,
    this.faltaJustificada = false,
    this.atraso = false,
  });

  int idcurso;
  String descripcionCurso;
  String periodo;
  int idHorario;
  int idDisciplina;
  String codigo;
  String disciplinaDescripcion;
  String nivel;
  String horario;
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
  bool asistencia, faltaJustificada, atraso;

  factory ModelViewAsistencia.fromJson(String str) =>
      ModelViewAsistencia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelViewAsistencia.fromMap(Map<String, dynamic> json) =>
      ModelViewAsistencia(
        idcurso: json["idcurso"],
        descripcionCurso: json["descripcion_curso"],
        periodo: json["periodo"],
        idHorario: json["id_horario"],
        idDisciplina: json["id_disciplina"],
        codigo: json["codigo"],
        disciplinaDescripcion: json["disciplina_descripcion"],
        nivel: json["nivel"],
        horario: json["horario"],
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
      );

  Map<String, dynamic> toMap() => {
        "idcurso": idcurso,
        "descripcion_curso": descripcionCurso,
        "periodo": periodo,
        "id_horario": idHorario,
        "id_disciplina": idDisciplina,
        "codigo": codigo,
        "disciplina_descripcion": disciplinaDescripcion,
        "nivel": nivel,
        "horario": horario,
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
      };
}
