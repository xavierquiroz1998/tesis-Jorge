import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class InscripcionesMantenimiento extends StatefulWidget {
  const InscripcionesMantenimiento({Key? key}) : super(key: key);

  @override
  State<InscripcionesMantenimiento> createState() =>
      _InscripcionesMantenimientoState();
}

class _InscripcionesMantenimientoState
    extends State<InscripcionesMantenimiento> {
  @override
  Widget build(BuildContext context) {
    var provInscripcion = Provider.of<InscripcionProvider>(context);
    return WhiteCard(
      title: "Mantenimiento de Inscripciones",
      child: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Periodo :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    //value: provHorario.infoDisciplina,
                    onChanged: (String? newValue) {
                      setState(() {
                        provInscripcion.mesSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provInscripcion.mesSelect,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provInscripcion.listadoMeses
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Descripción :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provInscripcion.ctrDescripcion,
                    hint: "",
                    icon: Icons.assignment,
                    length: 500,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Agrear"),
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
                    label: Center(child: Text("# Identificación")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Nombres")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Tipo")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Celular")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Estado")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("")),
                  )
                ],
                rows: provFamilia.listado.map<DataRow>((e) {
                  return DataRow(
                    //key: LocalKey(),
                    cells: <DataCell>[
                      DataCell(
                        Text(e.identificacion),
                      ),
                      DataCell(
                        Text(e.nombres),
                      ),
                      DataCell(
                        Text(e.tipo),
                      ),
                      DataCell(
                        Text(e.celular),
                      ),
                      DataCell(
                        Text(e.estado),
                      ),
                      DataCell(
                        Row(
                          children: [
                            e.estado == "A"
                                ? TextButton.icon(
                                    onPressed: () {
                                      // producto.product = e;
                                      // NavigationService.navigateTo(
                                      //     Flurorouter.ingreso);
                                    },
                                    icon: Icon(Icons.search),
                                    label: Text(""))
                                : Container(),
                            e.estado == "A"
                                ? TextButton.icon(
                                    onPressed: () async {
                                      // await showDialog(
                                      //     context: context,
                                      //     builder: (context) {
                                      //       return AlertDialog(
                                      //         title: Text("Anular"),
                                      //         content: Container(
                                      //           child: Text(
                                      //               "Seguro desea anular el item " +
                                      //                   e.detalle),
                                      //         ),
                                      //         actions: [
                                      //           TextButton(
                                      //             onPressed: () async {
                                      //               print("Opt anular??");
                                      //               await producto
                                      //                   .anular(e);
                                      //               Navigator.pop(context);
                                      //             },
                                      //             child: Text("Aceptar"),
                                      //           ),
                                      //           TextButton(
                                      //             onPressed: () {
                                      //               Navigator.pop(context);
                                      //             },
                                      //             child: Text("Cancelar"),
                                      //           ),
                                      //         ],
                                      //       );
                                      //     },
                                      //    );
                                    },
                                    icon: Icon(Icons.delete),
                                    label: Text(""))
                                : Container(),
                          ],
                        ),
                      ),
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
