import 'package:flutter/material.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Citas1 extends StatefulWidget {
  const Citas1({Key? key}) : super(key: key);

  @override
  State<Citas1> createState() => _Citas1teState();
}

class _Citas1teState extends State<Citas1> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Citas",
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
