import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Formulario2 extends StatefulWidget {
  const Formulario2({Key? key}) : super(key: key);

  @override
  State<Formulario2> createState() => _Formulario2State();
}

class _Formulario2State extends State<Formulario2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<HorarioProvider>(context, listen: false).getHorarios();
  }

  @override
  Widget build(BuildContext context) {
    final provHorario = Provider.of<HorarioProvider>(context);
    return SingleChildScrollView(
      child: WhiteCard(
        title: "Horarios",
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    provHorario.edit = false;
                    NavigationService.navigateTo(
                        Flurorouter.horarioMantenimiento);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nuevo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: DataTable(
                columns: <DataColumn>[
                  // const DataColumn(
                  //   label: Center(child: Text("Id")),
                  // ),
                  const DataColumn(
                    label: Center(child: Text("Disciplina")),
                  ),
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
                    label: Center(child: Text("Valor")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Horario")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Estado")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("")),
                  )
                ],
                rows: provHorario.lisHorarios.map<DataRow>((e) {
                  return DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>((states) {
                      if (e.estado != "A") {
                        return Colors.red.shade300;
                      }
                      return null;
                    }),
                    //key: LocalKey(),
                    cells: <DataCell>[
                      DataCell(
                        Text(e.nomDisciplina),
                      ),
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
                        Text(e.valor.toString()),
                      ),
                      DataCell(
                        Text(e.horario),
                      ),
                      DataCell(
                        Text(e.estado),
                      ),
                      DataCell(e.estado == "A"
                          ? Row(
                              children: [
                                TextButton.icon(
                                    onPressed: () {
                                      provHorario.edit = true;
                                      provHorario.modelHorariSelect = e;
                                      NavigationService.navigateTo(
                                          Flurorouter.horarioMantenimiento);
                                    },
                                    icon: Icon(Icons.edit),
                                    label: Text("")),
                                TextButton.icon(
                                    onPressed: () async {
                                      provHorario.modelHorariSelect = e;
                                      var ass =
                                          await provHorario.anularHorario();
                                      if (ass) {
                                        setState(() {});
                                      }
                                    },
                                    icon: Icon(Icons.delete),
                                    label: Text(""))
                              ],
                            )
                          : Container()),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
