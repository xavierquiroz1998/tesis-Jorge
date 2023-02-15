import 'dart:convert';

class ModelHorarios {
  ModelHorarios({
    required this.id,
    required this.idDisciplina,
    required this.nivel,
    required this.idCategoria,
    required this.idCiclo,
    required this.valor,
    required this.horario,
    required this.estado,
  });

  int id;
  int idDisciplina;
  String nivel;
  int idCategoria;
  int idCiclo;
  double valor;
  String horario;
  String estado;

  factory ModelHorarios.fromJson(String str) =>
      ModelHorarios.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelHorarios.fromMap(Map<String, dynamic> json) => ModelHorarios(
        id: json["id"],
        idDisciplina: json["id_disciplina"],
        nivel: json["nivel"],
        idCategoria: json["id_categoria"],
        idCiclo: json["id_ciclo"],
        valor: json["valor"],
        horario: json["horario"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_disciplina": idDisciplina,
        "nivel": nivel,
        "id_categoria": idCategoria,
        "id_ciclo": idCiclo,
        "valor": valor,
        "horario": horario,
        "estado": estado,
      };
}

class ModelViewHorarios {
  ModelViewHorarios({
    required this.idDisciplina,
    required this.nomDisciplina,
    required this.nivel,
    required this.idCategoria,
    required this.nomCategoria,
    required this.idCiclo,
    required this.nomCiclo,
    required this.valor,
    required this.horario,
    required this.estado,
    this.check= false
  });

  int idDisciplina;
  String nomDisciplina;
  String nivel;
  int idCategoria;
  String nomCategoria;
  int idCiclo;
  String nomCiclo;
  double valor;
  String horario;
  String estado;
  bool check;

  factory ModelViewHorarios.fromJson(String str) =>
      ModelViewHorarios.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelViewHorarios.fromMap(Map<String, dynamic> json) =>
      ModelViewHorarios(
        idDisciplina: json["id_disciplina"],
        nomDisciplina: json["nom_disciplina"],
        nivel: json["nivel"],
        idCategoria: json["id_categoria"],
        nomCategoria: json["nom_categoria"],
        idCiclo: json["id_ciclo"],
        nomCiclo: json["nom_ciclo"],
        valor: json["valor"]?.toDouble(),
        horario: json["horario"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id_disciplina": idDisciplina,
        "nom_disciplina": nomDisciplina,
        "nivel": nivel,
        "id_categoria": idCategoria,
        "nom_categoria": nomCategoria,
        "id_ciclo": idCiclo,
        "nom_ciclo": nomCiclo,
        "valor": valor,
        "horario": horario,
        "estado": estado,
      };
}
