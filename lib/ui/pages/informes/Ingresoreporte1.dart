import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/providers/informes/ingresoReporteProvider.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Ingresoreporte1 extends StatefulWidget {
  const Ingresoreporte1({Key? key}) : super(key: key);

  @override
  State<Ingresoreporte1> createState() => _Ingresoreporte1State();
}

class _Ingresoreporte1State extends State<Ingresoreporte1> {
  @override
  Widget build(BuildContext context) {
    final provi = Provider.of<IngresoReporteProvider>(context);
    return WhiteCard(
      title: "Reporte de pacientes",
      child: Column(children: [
        Row(children: [
          Text("IdReporte"),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: provi.controllerNombre,
            ),
          )),
        ]),
        Row(
          children: [
            Text("IdPaciente"),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: provi.controllerApellido,
              ),
            )),
          ],
        ),
        Row(
          children: [
            Text("IdEnfermera"),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: provi.controllerCedula,
              ),
            )),
          ],
        ),
        Row(
          children: [
            Text("Observacion"),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: provi.controllerObservacion,
              ),
            )),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text("${provi.accion}"),
        Row(
          children: [
            TextButton(
              // padding: const EdgeInsets.all(20),
              // textColor: Colors.white,
              // color: Colors.blue,
              onPressed: () {
                provi.guardar();
              },
              child: Text('Agregar'),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              // padding: const EdgeInsets.all(20),
              // textColor: Colors.white,
              // color: Colors.blue,
              onPressed: () {
                provi.modificar();
              },
              child: Text('Modificar'),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              // padding: const EdgeInsets.all(20),
              // textColor: Colors.white,
              // color: Colors.blue,
              onPressed: () {
                provi.eliminar();
              },
              child: Text('Eliminar'),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              // padding: const EdgeInsets.all(20),
              // textColor: Colors.white,
              // color: Colors.blue,
              onPressed: () => null,
              child: Text('Actualizar'),
            ),
          ],
        ),
      ]),
    );
  }
}
