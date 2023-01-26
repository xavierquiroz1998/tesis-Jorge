import 'package:flutter/material.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class ConsultaReporte extends StatefulWidget {
  const ConsultaReporte({Key? key}) : super(key: key);

  @override
  State<ConsultaReporte> createState() => _ConsultaReporteState();
}

class _ConsultaReporteState extends State<ConsultaReporte> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Consulta Reporte",
      child: Column(children: [
        Row(children: [
          Text("Nombre"),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(),
          )),
        ]),
        Row(
          children: [
            Text("Apellido"),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(),
            )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
          // padding: const EdgeInsets.all(20),
          // textColor: Colors.white,
          // color: Colors.blue,
          onPressed: () => null,
          child: Text('Consultar'),
        ),
      ]),
    );
  }
}
