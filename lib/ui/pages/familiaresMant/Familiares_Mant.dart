import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class FamiliaresMantenimiento extends StatefulWidget {
  const FamiliaresMantenimiento({Key? key}) : super(key: key);

  @override
  State<FamiliaresMantenimiento> createState() => _FamiliaresMantenimientoState();
}

class _FamiliaresMantenimientoState extends State<FamiliaresMantenimiento> {
  @override
  Widget build(BuildContext context) {
        return WhiteCard(
      title: "Familiares o Invitados",
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Nombre del Familiar :"),
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