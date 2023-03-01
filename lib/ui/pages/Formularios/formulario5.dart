import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Formulario5 extends StatefulWidget {
  const Formulario5({Key? key}) : super(key: key);

  @override
  State<Formulario5> createState() => _Formulario5State();
}

class _Formulario5State extends State<Formulario5> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<InscripcionProvider>(context, listen: false).getCursos();
  }

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
                  provInscripcion.edit = false;
                  NavigationService.navigateTo(
                      Flurorouter.inscripcionMantenimiento);
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
                                onPressed: () {
                                  provInscripcion.edit = true;
                                  provInscripcion.cursoSelect = e;
                                  NavigationService.navigateTo(
                                      Flurorouter.inscripcionMantenimiento);
                                },
                                icon: Icon(Icons.edit),
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
