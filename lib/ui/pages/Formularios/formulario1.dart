import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/disciplinas/Disciplina_Provider.dart';
import 'package:tesis/injection.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import '../widget/whiteCard.dart';

class Formulario1 extends StatefulWidget {
  const Formulario1({Key? key}) : super(key: key);

  @override
  State<Formulario1> createState() => _Formulario1State();
}

class _Formulario1State extends State<Formulario1> {
  DisciplinaProvider patProvider = DisciplinaProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<DisciplinaProvider>(context, listen: false).getDisciplinas();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var ptProvider = Provider.of<DisciplinaProvider>(context);
    return WhiteCard(
      title: "Disciplinas",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  // NavigationService.navigateTo(
                  //     Flurorouter.disciplinaMantenimiento);

                  bool? dialogdisciplina = await showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("Disciplina"),
                        content: Container(
                          width: width / 5,
                          height: height / 4,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Codigo"),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 7),
                                      child: TextFormField(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Disciplina"),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 7),
                                      child: TextFormField(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                return Navigator.pop(context, false);
                              },
                              child: Text("Cancelar")),
                          TextButton(
                              onPressed: () {
                                return Navigator.pop(context, true);
                              },
                              child: Text("Guardar")),
                        ],
                      );
                    },
                  );
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
                  label: Center(child: Text("Cod. Ref")),
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
              rows: ptProvider.listado.map<DataRow>((e) {
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
                      Text(e.codigo),
                    ),
                    DataCell(
                      Text(e.descripcion),
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
