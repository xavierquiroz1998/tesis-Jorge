import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class ProfesorXhorario extends StatefulWidget {
  const ProfesorXhorario({Key? key}) : super(key: key);

  @override
  State<ProfesorXhorario> createState() => _ProfesorXhorarioState();
}

class _ProfesorXhorarioState extends State<ProfesorXhorario> {
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<HorarioProvider>(context, listen: false).getHorarios_x_profesor();
  }

  @override
  Widget build(BuildContext context) {
    final provHorario = Provider.of<HorarioProvider>(context);
    return WhiteCard(
      title: "Profesor por Horario",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  NavigationService.navigateTo(
                      Flurorouter.inscripcionMantenimiento);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Guardar",
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
                const DataColumn(
                  label: Center(child: Text("Check")),
                ),
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
                )
              ],
              rows: provHorario.lisHorarios.map<DataRow>((e) {
                return DataRow(
                  //key: LocalKey(),
                  cells: <DataCell>[
                    DataCell(
                      Checkbox(
                          value: e.check,
                          onChanged: (value) {
                            e.check = value!;
                            setState(() {});
                          }),
                    ),
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
                  ],
                );
              }).toList(),
            ),
          ),
       
        ],
      ),
    );
  }
}
