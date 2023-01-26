import 'package:flutter/material.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class PacienteMant extends StatefulWidget {
  const PacienteMant({Key? key}) : super(key: key);

  @override
  State<PacienteMant> createState() => _PacienteMantState();
}

class _PacienteMantState extends State<PacienteMant> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Registro de paciente",
      child: Column(
        children: [
          Row(
            children: [
              Text("Cedula"),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(),
              )),
            ],
          ),

          Row(children: [
            Text("Nombre"),
            SizedBox(
              height: 20,
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
                height: 20,
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
            child: Text('Registrar'),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            // padding: const EdgeInsets.all(20),
            // textColor: Colors.white,
            // color: Colors.blue,
            onPressed: () => null,
            child: Text('Ingresar'),
          ),

          // ya avanza

          //yaaaaaaaa
        ],
      ),
    );
  }
}
