import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/domain/providers/cursos/cursos_provider.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class CursosConsulSocios extends StatefulWidget {
  const CursosConsulSocios({Key? key}) : super(key: key);

  @override
  State<CursosConsulSocios> createState() => _CursosConsulSociosState();
}

class _CursosConsulSociosState extends State<CursosConsulSocios> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CurosProvider>(context, listen: false).getDisciplinas();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final provHorario = Provider.of<CurosProvider>(context);
    return WhiteCard(
      title: "Consulta de Disciplinas",
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text("Disciplinas :", style: CustomLabels.h11),
              ),
              Expanded(
                child: DropdownButton<ModelDisciplina>(
                  isExpanded: true,
                  //value: provHorario.infoDisciplina,
                  onChanged: (ModelDisciplina? newValue) {
                    setState(() {
                      provHorario.disciplinaSlect = newValue!;
                    });
                    provHorario.getHorarios_x_disciplina(
                        provHorario.disciplinaSlect == null
                            ? 0
                            : provHorario.disciplinaSlect!.id);
                  },

                  hint: Text(
                    provHorario.disciplinaSlect == null
                        ? ""
                        : provHorario.disciplinaSlect!.descripcion,
                    style: TextStyle(color: Colors.black),
                  ),
                  items: provHorario.listDisciplina
                      .map<DropdownMenuItem<ModelDisciplina>>(
                          (ModelDisciplina value) {
                    return DropdownMenuItem<ModelDisciplina>(
                      value: value,
                      child: Text(
                        value.descripcion == "" ? "prueba" : value.descripcion,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: DataTable(
              columns: <DataColumn>[
                const DataColumn(
                  label: Center(child: Text("Nivel")),
                ),
                const DataColumn(
                  label: Center(child: Text("Categoria")),
                ),
                const DataColumn(
                  label: Center(child: Text("Ciclo")),
                ),
                const DataColumn(
                  label: Center(child: Text("Horario")),
                ),
                const DataColumn(
                  label: Center(child: Text("Ver Profesor")),
                ),
              ],
              rows: provHorario.lisHorarios
                  .map(
                    (e) => DataRow(
                      //key: LocalKey(),
                      cells: <DataCell>[
                        DataCell(
                          Text(e.nivel),
                        ),
                        DataCell(
                          Text(e.nomCategoria),
                        ),
                        DataCell(
                          Text(e.nomCiclo),
                        ),
                        DataCell(
                          Text(e.horario),
                        ),
                        DataCell(TextButton.icon(
                            onPressed: () async {
                              await provHorario.getProfesor_x_Horario(e.id);
                              if (provHorario.profesor != null) {
                                if (provHorario.profesor!.id != 0) {
                                  await showProfesor(
                                      context, width, height, provHorario);
                                }
                              }
                              setState(() {});
                            },
                            icon: Icon(Icons.search),
                            label: Text(""))),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showProfesor(BuildContext context, double width, double height,
      CurosProvider provider) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Profesor"),
          content: Container(
            width: width / 3,
            height: height / 3,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text("Identificación :", style: CustomLabels.h11),
                    ),
                    Expanded(
                      child: Text(provider.profesor!.identificacion),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text("Nombres :", style: CustomLabels.h11),
                    ),
                    Expanded(
                      child: Text(
                          "${provider.profesor!.nombres} ${provider.profesor!.apellidos}"),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text("Celular :", style: CustomLabels.h11),
                    ),
                    Expanded(
                      child: Text(provider.profesor!.celular),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text("Correo :", style: CustomLabels.h11),
                    ),
                    Expanded(
                      child: Text(provider.profesor!.correo),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text("Dirección :", style: CustomLabels.h11),
                    ),
                    Expanded(
                      child: Text(provider.profesor!.domicilio),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  return Navigator.pop(context, false);
                },
                child: Text("Aceptar")),
          ],
        );
      },
    );
  }
}
