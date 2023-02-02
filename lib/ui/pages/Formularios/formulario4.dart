import 'package:flutter/material.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Formulario4 extends StatefulWidget {
  const Formulario4({Key? key}) : super(key: key);

  @override
  State<Formulario4> createState() => _Formulario4State();
}

class _Formulario4State extends State<Formulario4> {
  @override
  Widget build(BuildContext context) {
        return WhiteCard(
      title: "Familiares o Invitados",
      child: Column(
        children: [
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(
                        Flurorouter.familiarMantenimiento);
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
