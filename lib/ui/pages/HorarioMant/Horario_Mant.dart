import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class HorarioMantenimiento extends StatefulWidget {
  const HorarioMantenimiento({Key? key}) : super(key: key);

  @override
  State<HorarioMantenimiento> createState() => _HorarioMantenimientoState();
}

class _HorarioMantenimientoState extends State<HorarioMantenimiento> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Mantenimiento de Horarios",
      child: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                Text("Nombre de Horario :"),
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
