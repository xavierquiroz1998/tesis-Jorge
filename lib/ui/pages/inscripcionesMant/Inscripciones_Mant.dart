import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class InscripcionesMantenimiento extends StatefulWidget {
  const InscripcionesMantenimiento({Key? key}) : super(key: key);

  @override
  State<InscripcionesMantenimiento> createState() =>
      _InscripcionesMantenimientoState();
}

class _InscripcionesMantenimientoState
    extends State<InscripcionesMantenimiento> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Mantenimiento de Inscripciones",
      child: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                Text("Nombre :"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextFormField(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
