import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/createPdf.dart';
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
    Provider.of<FamiliaresProvider>(context, listen: false)
        .getFamiliares_x_usuario();
  }

  @override
  Widget build(BuildContext context) {
    final provFamilia = Provider.of<FamiliaresProvider>(context);
    return SingleChildScrollView(
      child: WhiteCard(
        title: "Familiares o Invitados",
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    provFamilia.edit = false;
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
                      DataCell(e.estado == "A"
                          ? Row(
                              children: [
                                TextButton.icon(
                                    onPressed: () {
                                      provFamilia.edit = true;
                                      provFamilia.familiarSelect = e;
                                      NavigationService.navigateTo(
                                          Flurorouter.familiarMantenimiento);
                                    },
                                    icon: Icon(Icons.edit),
                                    label: Text("")),
                                TextButton.icon(
                                  onPressed: () async {
                                    provFamilia.familiarSelect = e;
                                    var ass = await provFamilia.anular();
                                    if (ass) {
                                      setState(() {});
                                    }
                                  },
                                  icon: Icon(Icons.delete),
                                  label: Text(""),
                                ),
                                TextButton.icon(
                                  onPressed: () async {
                                    provFamilia.familiarSelect = e;
                                    var img = Image.asset(
                                      "logo.jpeg",
                                      fit: BoxFit.contain,
                                    );

 ByteData bytes =
                                        await rootBundle.load('logo.jpeg');
                                    var buffer = bytes.buffer;

                                    var logo = Uint8List.view(buffer);
                                    PdfReportc.generate(e, "codRef", logo);
                                  },
                                  icon: Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.red,
                                  ),
                                  label: Text(""),
                                ),
                                TextButton.icon(
                                  onPressed: () async {
                                    provFamilia.familiarSelect = e;
                                    var img = Image.asset(
                                      "logo.jpeg",
                                      fit: BoxFit.contain,
                                    );

                                   
                                    PdfReportc.generateCarta(e, "codRef");
                                  },
                                  icon: Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.green,
                                  ),
                                  label: Text(""),
                                )
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
}
