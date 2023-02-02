import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class ProfesorMantenimiento extends StatefulWidget {
  const ProfesorMantenimiento({Key? key}) : super(key: key);

  @override
  State<ProfesorMantenimiento> createState() => _ProfesorMantenimientoState();
}

class _ProfesorMantenimientoState extends State<ProfesorMantenimiento> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Mantenimiento de Profesores",
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Nombre de Profesor :"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
