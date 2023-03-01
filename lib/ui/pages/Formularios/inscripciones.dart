import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class InscripcionesConsulta extends StatefulWidget {
  const InscripcionesConsulta({Key? key}) : super(key: key);

  @override
  State<InscripcionesConsulta> createState() => _InscripcionesConsultaState();
}

class _InscripcionesConsultaState extends State<InscripcionesConsulta> {
  @override
  Widget build(BuildContext context) {
    var provInscripcion = Provider.of<InscripcionProvider>(context);
    return WhiteCard(
      title: "Inscripciones",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // NavigationService.navigateTo(
                  //     Flurorouter.familiarMantenimiento);
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
                  label: Center(child: Text("Id")),
                ),
                const DataColumn(
                  label: Center(child: Text("Descripción")),
                ),
                const DataColumn(
                  label: Center(child: Text("Periodo")),
                ),
                const DataColumn(
                  label: Center(child: Text("Estado")),
                ),

                const DataColumn(
                  label: Center(child: Text("")),
                ),
              ],
              rows: provInscripcion.lisCursos
                  .map(
                    (e) => DataRow(
                      //key: LocalKey(),
                      cells: <DataCell>[
                        DataCell(
                          Text("${e.id}"),
                        ),
                        DataCell(
                          Text(e.descripcion),
                        ),
                        DataCell(
                          Text(e.periodo),
                        ),
                        DataCell(
                          Text(e.estado),
                        ),
                        DataCell(
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.search),
                                label: Text(""),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                                label: Text(""),
                              ),
                            ],
                          ),
                        ),
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
}
