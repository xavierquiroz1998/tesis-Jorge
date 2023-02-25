import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Formulario4 extends StatefulWidget {
  const Formulario4({Key? key}) : super(key: key);

  @override
  State<Formulario4> createState() => _Formulario4State();
}

class _Formulario4State extends State<Formulario4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FamiliaresProvider>(context, listen: false).getFamiliares();
  }

  @override
  Widget build(BuildContext context) {
    final provFamilia = Provider.of<FamiliaresProvider>(context);
    return WhiteCard(
      title: "Familiares o Invitados",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  NavigationService.navigateTo(
                      Flurorouter.familiarMantenimiento);
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
    );
  }
}
