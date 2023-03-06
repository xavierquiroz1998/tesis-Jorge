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
    return SingleChildScrollView(
      child: WhiteCard(
        title: "Usuarios",
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      provUsuarios.edit = false;
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
                        color:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          if (e.estado != "A") {
                            return Colors.red.shade300;
                          }
                          return null;
                        }),
                        cells: [
                          DataCell(Text("${e.identificacion}")),
                          DataCell(Text("${e.nombres}")),
                          DataCell(Text("${e.celular}")),
                          DataCell(Text("${e.correo}")),
                          DataCell(Text("${e.estado}")),
                          DataCell(e.estado == "A"
                              ? Row(
                                  children: [
                                    TextButton.icon(
                                        onPressed: () {
                                          provUsuarios.edit = true;
                                          provUsuarios.usuarioSelect = e;
                                          NavigationService.navigateTo(
                                              Flurorouter
                                                  .pacienteMantenimineto);
                                        },
                                        icon: Icon(Icons.edit),
                                        label: Text("")),
                                    TextButton.icon(
                                        onPressed: () async {
                                          provUsuarios.usuarioSelect = e;
                                          var ass = await provUsuarios.anular();
                                          if (ass) {
                                            setState(() {});
                                          }
                                        },
                                        icon: Icon(Icons.delete),
                                        label: Text(""))
                                  ],
                                )
                              : Container()),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
