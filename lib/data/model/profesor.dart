import 'dart:convert';

class ModelProfesor {
  ModelProfesor({
    required this.id,
    required this.identificacion,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.correo,
    required this.domicilio,
    required this.estado,
  });

  int id;
  String identificacion;
  String nombres;
  String apellidos;
  String celular;
  String correo;
  String domicilio;
  String estado;

  factory ModelProfesor.fromJson(String str) =>
      ModelProfesor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelProfesor.fromMap(Map<String, dynamic> json) => ModelProfesor(
        id: json["id"],
        identificacion: json["identificacion"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        celular: json["celular"],
        correo: json["correo"],
        domicilio: json["domicilio"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "identificacion": identificacion,
        "nombres": nombres,
        "apellidos": apellidos,
        "celular": celular,
        "correo": correo,
        "domicilio": domicilio,
        "estado": estado,
      };
}

class ModelProfesorXHorario {
    ModelProfesorXHorario({
        required this.id,
        required this.idProfesor,
        required this.idHorario,
    });

    int id;
    int idProfesor;
    int idHorario;

    factory ModelProfesorXHorario.fromJson(String str) => ModelProfesorXHorario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ModelProfesorXHorario.fromMap(Map<String, dynamic> json) => ModelProfesorXHorario(
        id: json["id"],
        idProfesor: json["id_profesor"],
        idHorario: json["id_horario"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "id_profesor": idProfesor,
        "id_horario": idHorario,
    };
}

