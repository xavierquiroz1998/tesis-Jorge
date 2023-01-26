import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/enfermeras/enfermeraProvider.dart';
import 'package:tesis/domain/providers/pacientes/pacienteProvider.dart';
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

    var proTem = Provider.of<PacientesProvider>(context, listen: false);
    proTem.cargarPaciente();
  }

  @override
  Widget build(BuildContext context) {
    final proTem = Provider.of<PacientesProvider>(context);
    return WhiteCard(
      title: "Ingreso paciente",
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
                  child: Text("Nueva paciente"))
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
              ],
              rows: proTem.listEnfermeras
                  .map(
                    (e) => DataRow(
                      cells: [
                        DataCell(Text("${e.idPacinete}")),
                        DataCell(Text("${e.nombre}")),
                        DataCell(Text("${e.apellido}")),
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
