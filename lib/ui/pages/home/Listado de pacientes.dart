import 'package:flutter/material.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class PacientesConsulta extends StatelessWidget {
  const PacientesConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "listado de pacientes",
      child: Column(children: [
        SizedBox(
          height: 40,
        ),
        TextButton(
          // padding: const EdgeInsets.all(20),
          // textColor: Colors.white,
          // color: Colors.blue,
          onPressed: () => null,
          child: Text('Citados'),
        ),
      ]

          //Text("esto es una columna 1"),
          // SizedBox(
          // height: 20,
          // ),
          //  Text("esto es una columna 2"),

          ),
    );
  }
}
