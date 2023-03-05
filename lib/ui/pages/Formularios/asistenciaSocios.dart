import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/asistencias_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';
import 'package:tesis/ui/style/utilview.dart';

class AsistenciasSocios extends StatefulWidget {
  const AsistenciasSocios({Key? key}) : super(key: key);

  @override
  State<AsistenciasSocios> createState() => _AsistenciasSociosState();
}

class _AsistenciasSociosState extends State<AsistenciasSocios> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AsistenciasProvider>(context, listen: false).getAsistencia();
  }

  @override
  Widget build(BuildContext context) {
    final provAsistencia = Provider.of<AsistenciasProvider>(context);
    return WhiteCard(
      title: "Asistencia de Socios",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  provAsistencia.edit = false;
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
                  label: Center(child: Text("Periodo")),
                ),
                const DataColumn(
                  label: Center(child: Text("Fecha")),
                ),
                const DataColumn(
                  label: Center(child: Text("Descripción")),
                ),
                const DataColumn(
                  label: Center(child: Text("Estado")),
                ),
                const DataColumn(
                  label: Center(child: Text("")),
                )
              ],
              rows: provAsistencia.listAsistencias
                  .map((e) => DataRow(
                        color:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          if (e.estado != "A") {
                            return Colors.red.shade300;
                          }
                          return null;
                        }),
                        cells: <DataCell>[
                          DataCell(
                            Text(e.periodo),
                          ),
                          DataCell(
                            Text(DateFormat('dd-MM-yyyy').format(e.fecha)),
                          ),
                          DataCell(SizedBox(
                            width: 150,
                            child: Text(e.descripcion),
                          )),
                          DataCell(
                            Text(e.estado),
                          ),
                          DataCell(e.estado == "A"
                              ? Row(
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {
                                        provAsistencia.edit = true;
                                        provAsistencia.asistenciaSelect = e;
                                        NavigationService.navigateTo(
                                            Flurorouter.asistenciasMant);
                                      },
                                      icon: Icon(Icons.edit),
                                      label: Text(""),
                                    ),
                                    TextButton.icon(
                                      onPressed: () async {
                                        provAsistencia.asistenciaSelect = e;
                                        if (await provAsistencia.anular()) {
                                          setState(() {});

                                          UtilView.messageSnackNewAccess(
                                              "Anulado\ncon exito", context);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      label: Text(""),
                                    ),
                                  ],
                                )
                              : Container())
                        ],
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
