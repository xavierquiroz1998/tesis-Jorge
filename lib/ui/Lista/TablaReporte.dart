import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/providers/reportProvider.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class TablaReporte extends StatefulWidget {
  const TablaReporte({Key? key}) : super(key: key);
  @override
  _TablaReporte createState() => _TablaReporte();
}

class _TablaReporte extends State<TablaReporte> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var temp = Provider.of<ReportProvider>(context, listen: false);
    temp.cargarEmfermeras();
  }

  @override
  Widget build(BuildContext context) {
    var temp = Provider.of<ReportProvider>(context);
    return Container(
      width: double.infinity,
      child: WhiteCard(
        title: "reporte",
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('Nombre',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Apellido',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Cedula',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Observacion',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('John')),
              DataCell(Text('Student')),
              DataCell(Text('0977676')),
              DataCell(Text('Bien')),
            ]),
            DataRow(cells: [
              DataCell(Text('John')),
              DataCell(Text('Student')),
              DataCell(Text('0977676')),
              DataCell(Text('Bien')),
            ]),
            DataRow(cells: [
              DataCell(Text('John')),
              DataCell(Text('Student')),
              DataCell(Text('0977676')),
              DataCell(Text('Bien')),
            ]),
            DataRow(cells: [
              DataCell(Text('John')),
              DataCell(Text('Student')),
              DataCell(Text('0977676')),
              DataCell(Text('Bien')),
            ]),
          ],
        ),
      ),
    );
  }
}
