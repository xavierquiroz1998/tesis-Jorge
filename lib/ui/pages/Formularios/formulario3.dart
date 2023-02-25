import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/profesor/profesor_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Formulario3 extends StatefulWidget {
  const Formulario3({Key? key}) : super(key: key);

  @override
  State<Formulario3> createState() => _Formulario3State();
}

class _Formulario3State extends State<Formulario3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfesorProvider>(context, listen: false).getProfesores();
  }

  @override
  Widget build(BuildContext context) {
    final provProfesor = Provider.of<ProfesorProvider>(context);
    return WhiteCard(
      title: "Profesores",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              TextButton(
                onPressed: () {
                  NavigationService.navigateTo(
                      Flurorouter.profesorMantenimiento);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nuevo Profesor",
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
                  label: Center(child: Text("Identificación")),
                ),
                const DataColumn(
                  label: Center(child: Text("Nombres")),
                ),
                const DataColumn(
                  label: Center(child: Text("Celular")),
                ),
                const DataColumn(
                  label: Center(child: Text("correo")),
                ),
                const DataColumn(
                  label: Center(child: Text("Estado")),
                ),
                const DataColumn(
                  label: Center(child: Text("")),
                )
              ],
              rows: provProfesor.listProfesores.map<DataRow>((e) {
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
                      Text(e.identificacion),
                    ),
                    DataCell(
                      Text("${e.nombres}-${e.apellidos}"),
                    ),
                    DataCell(
                      Text(e.celular),
                    ),
                    DataCell(
                      Text(e.correo),
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
