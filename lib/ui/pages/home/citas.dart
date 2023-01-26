import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/CrearCita/CitaProvider.dart';
import 'package:tesis/domain/providers/enfermeras/enfermeraProvider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class CitaCons extends StatefulWidget {
  const CitaCons({Key? key}) : super(key: key);

  @override
  State<CitaCons> createState() => _CitaConsState();
}

class _CitaConsState extends State<CitaCons> {
  @override
  void initState() {
    super.initState();

    var proTem = Provider.of<CitaProvider>(context, listen: false);
    proTem.cargarCita();
  }

  @override
  Widget build(BuildContext context) {
    final proTem = Provider.of<CitaProvider>(context);
    var formato = DateFormat('yyyy-MM-dd hh:mm');
    return WhiteCard(
      title: "Consulta de Citas",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(Flurorouter.citas1);
                  },
                  child: Text("Nueva Cita"))
            ],
          ),
          Container(
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(
                    label: Text('Cedula',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Nombre',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Apellido',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Hora',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Fcha',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: proTem.listCita
                  .map(
                    (e) => DataRow(
                      cells: [
                        DataCell(Text("${e.id}")),
                        DataCell(Text("${e.nombre}")),
                        DataCell(Text("${e.apellido}")),
                        DataCell(Text(
                            "${formato.format(e.fecha ?? DateTime.now())}")),
                        DataCell(Text("${e.hora}")),
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
