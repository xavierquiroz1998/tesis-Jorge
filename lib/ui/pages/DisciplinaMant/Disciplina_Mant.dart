
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class DisciplinaMantenimiento extends StatefulWidget {
  const DisciplinaMantenimiento({Key? key}) : super(key: key);

  @override
  State<DisciplinaMantenimiento> createState() => _DisciplinaMantenimientoState();
}

class _DisciplinaMantenimientoState extends State<DisciplinaMantenimiento> {
  @override
  Widget build(BuildContext context) {
       return WhiteCard(
      title: "Mantenimiento de Disciplinas",
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Nombre de disciplina :"),
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
