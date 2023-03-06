import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/disciplinas/Disciplina_Provider.dart';
import 'package:tesis/injection.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/style/utilview.dart';
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
    return SingleChildScrollView(
      child: WhiteCard(
        title: "Disciplinas",
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    ptProvider.disciplina = null;

                    bool? dialogdisciplina =
                        await showDisciplina(context, width, height);
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
                      DataCell(e.estado == "A"
                          ? Row(
                              children: [
                                TextButton.icon(
                                    onPressed: () async {
                                      patProvider.disciplina = e;
                                      patProvider.setDisciplina();
                                      await showDisciplina(
                                          context, width, height);
                                    },
                                    icon: Icon(Icons.edit),
                                    label: Text("")),
                                TextButton.icon(
                                    onPressed: () async {
                                      patProvider.disciplina = e;
                                      var ss = await patProvider.anular();
                                      if (ss) {
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
      ),
    );
  }

  Future<bool?> showDisciplina(
      BuildContext context, double width, double height) {
    return showDialog(
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
                        child: TextFormField(
                          controller: patProvider.ctrCodigo,
                        ),
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
                        child: TextFormField(
                          controller: patProvider.ctrDescripcion,
                        ),
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
                onPressed: () async {
                  if (patProvider.ctrCodigo.text == "") {
                    UtilView.messageDanger("Ingrese un Codigo de Disciplina");
                    return;
                  }
                  if (patProvider.ctrDescripcion.text == "") {
                    UtilView.messageDanger("Ingrese una Descripción");
                    return;
                  }
                  bool res = await patProvider.guardar();
                  if (res) {
                    setState(() {});
                    return Navigator.pop(context, true);
                  }
                },
                child: Text("Guardar")),
          ],
        );
      },
    );
  }
}
