import 'package:flutter/material.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Formulario3 extends StatefulWidget {
  const Formulario3({Key? key}) : super(key: key);

  @override
  State<Formulario3> createState() => _Formulario3State();
}

class _Formulario3State extends State<Formulario3> {
  @override
  Widget build(BuildContext context) {
       return WhiteCard(
      title: "Profesores",
      child: Column(
        children: [
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(
                        Flurorouter.profesorMantenimiento);
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
