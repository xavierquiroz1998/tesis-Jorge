import 'package:flutter/material.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Enfermera extends StatefulWidget {
  const Enfermera({Key? key}) : super(key: key);

  @override
  State<Enfermera> createState() => _EnfermeraState();
}

class _EnfermeraState extends State<Enfermera> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Registro de paciente",
      child: Column(
        children: [
          Row(children: [
            Text("Cedula"),
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
              Text("Nombre"),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Registrar'),
                ),
                style: TextButton.styleFrom(
                  //primary: Colors.white,
                  backgroundColor: Colors.blue,
                  //onSurface: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Cancelar'),
                ),
                style: TextButton.styleFrom(
                  //primary: Colors.white,
                  backgroundColor: Colors.blue,
                  //onSurface: Colors.grey,
                ),
              ),
            ],
          )
          // ya avanza

          //yaaaaaaaa
        ],
      ),
    );
  }
}
