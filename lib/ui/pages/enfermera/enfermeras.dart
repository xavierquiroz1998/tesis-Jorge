import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/enfermeras/enfermeraProvider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class EnfermerasCons extends StatefulWidget {
  const EnfermerasCons({Key? key}) : super(key: key);

  @override
  State<EnfermerasCons> createState() => _EnfermerasConsState();
}

class _EnfermerasConsState extends State<EnfermerasCons> {
  @override
  void initState() {
    super.initState();

    var proTem = Provider.of<EnfermerProvider>(context, listen: false);
    proTem.cargarEnfermeras();
  }

  @override
  Widget build(BuildContext context) {
    final proTem = Provider.of<EnfermerProvider>(context);
    return WhiteCard(
      title: "Consulta de Enfermeras",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(Flurorouter.enfermeraMant);
                  },
                  child: Text("Nueva Enfermera"))
            ],
          ),
          Container(
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(
                    label: Text('Nombre',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Apellido',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Cedula',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Estado',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: proTem.listEnfermeras
                  .map(
                    (e) => DataRow(
                      cells: [
                        DataCell(Text("${e.nombre}")),
                        DataCell(Text("${e.apellido}")),
                        DataCell(Text("${e.idEnfermera}")),
                        DataCell(Text("${e.estado}")),
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
