import 'package:flutter/material.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import '../widget/whiteCard.dart';

class Formulario1 extends StatefulWidget {
  const Formulario1({Key? key}) : super(key: key);

  @override
  State<Formulario1> createState() => _Formulario1State();
}

class _Formulario1State extends State<Formulario1> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Disciplinas",
      child: Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(
                        Flurorouter.disciplinaMantenimiento);
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
      ),
    );
  }
}
