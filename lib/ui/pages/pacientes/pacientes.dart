import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/enfermeras/enfermeraProvider.dart';
import 'package:tesis/domain/providers/pacientes/pacienteProvider.dart';
import 'package:tesis/domain/providers/usuario/usuario_Provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class PacienteCons extends StatefulWidget {
  const PacienteCons({Key? key}) : super(key: key);

  @override
  State<PacienteCons> createState() => _PacienteConsState();
}

class _PacienteConsState extends State<PacienteCons> {
  @override
  void initState() {
    super.initState();

    Provider.of<UsuarioProvider>(context, listen: false).getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    final provUsuarios = Provider.of<UsuarioProvider>(context);
    return WhiteCard(
      title: "Usuarios",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(
                        Flurorouter.pacienteMantenimineto);
                  },
                  child: Text("Nuevo"))
            ],
          ),
          Container(
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(
                    label: Text('Identificación',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Nombres',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Celular',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Correo',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Estado',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: provUsuarios.listUsuario
                  .map(
                    (e) => DataRow(
                      cells: [
                        DataCell(Text("${e.identificacion}")),
                        DataCell(Text("${e.nombres}")),
                        DataCell(Text("${e.celular}")),
                        DataCell(Text("${e.correo}")),
                        DataCell(Text("${e.estado}")),
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
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
