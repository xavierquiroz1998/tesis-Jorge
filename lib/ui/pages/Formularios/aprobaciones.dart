import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class AprobacionSocio extends StatefulWidget {
  const AprobacionSocio({Key? key}) : super(key: key);

  @override
  State<AprobacionSocio> createState() => _AprobacionSocioState();
}

class _AprobacionSocioState extends State<AprobacionSocio> {
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
      title: "Aprobacion de Socios",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () async {
                  await provFamilia.aprobarFamiliares();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Aprobar",
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
              rows: provFamilia.listado
                  .where((element) => element.estado != "A")
                  .map<DataRow>((e) {
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
                      Checkbox(
                        value: e.check,
                        onChanged: (value) {
                          e.check = value!;
                          setState(() {});
                        },
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
