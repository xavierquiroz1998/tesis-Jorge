import 'package:flutter/material.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Formulario2 extends StatefulWidget {
  const Formulario2({Key? key}) : super(key: key);

  @override
  State<Formulario2> createState() => _Formulario2State();
}

class _Formulario2State extends State<Formulario2> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Horarios",
      child: Column(
        children: [
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(
                        Flurorouter.horarioMantenimiento);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nuevo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
