import 'package:flutter/material.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class CitaMedica extends StatelessWidget {
  const CitaMedica({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "CITA MEDICA",
      child: Column(children: [
        Row(children: [
          Text("Cedula"),
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
            Text("Nombre"),
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
        Row(
          children: [
            Text("Apellido"),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(),
            )),
          ],
        ),
        Row(
          children: [
            Text("hora"),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(),
            )),
          ],
        ),
        Row(
          children: [
            Text("Fecha"),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(),
            )),
          ],
        ),
        //Row(children: [
        //  Text("Dia"),
        // new DropdownButton<String>(
        //   items: <String>[
        //     'Lunes',
        //    'Martes',
        //   'Miercoles',
        //  'Jueves',
        //    'Viernes',
        //   'Sabado'
        //  ].map((String value) {
        //     return new DropdownMenuItem<String>(
        //      value: value,
        //      child: new Text(value),
        //     );
        //    }).toList(),
        //   onChanged: (_) {},
        //  )
        //  ]),
        //Text("esto es una columna 1"),
        // SizedBox(
        // height: 20,
        // ),
        //  Text("esto es una columna 2"),
        TextButton(
          // padding: const EdgeInsets.all(20),
          // textColor: Colors.white,
          // color: Colors.blue,
          onPressed: () => null,
          child: Text('Registrar'),
        ),
      ]),
    );
  }
}
