import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class AsistenciasSocios extends StatefulWidget {
  const AsistenciasSocios({Key? key}) : super(key: key);

  @override
  State<AsistenciasSocios> createState() => _AsistenciasSociosState();
}

class _AsistenciasSociosState extends State<AsistenciasSocios> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Asistencia de Socios",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  NavigationService.navigateTo(Flurorouter.asistenciasMant);
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
                  label: Center(child: Text("Curso")),
                ),
                const DataColumn(
                  label: Center(child: Text("Fecha")),
                ),
                const DataColumn(
                  label: Center(child: Text("Observación")),
                ),
                const DataColumn(
                  label: Center(child: Text("Estado")),
                )
              ],
              rows: [
                DataRow(
                  //key: LocalKey(),
                  cells: <DataCell>[
                    DataCell(
                      Text(""),
                    ),
                    DataCell(
                      Text(""),
                    ),
                    DataCell(
                      Text(""),
                    ),
                    DataCell(
                      Text(""),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
