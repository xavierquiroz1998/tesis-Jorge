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
                  provProfesor.edit = false;
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
                    DataCell(e.estado == "A"
                        ? Row(
                            children: [
                              TextButton.icon(
                                  onPressed: () {
                                    provProfesor.edit = true;
                                    provProfesor.profeSelect = e;
                                    NavigationService.navigateTo(
                                        Flurorouter.profesorMantenimiento);
                                  },
                                  icon: Icon(Icons.edit),
                                  label: Text("")),
                              TextButton.icon(
                                  onPressed: () async {
                                    provProfesor.profeSelect = e;
                                    var ass = await provProfesor.anular();
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
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
