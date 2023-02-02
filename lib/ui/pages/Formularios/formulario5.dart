import 'package:flutter/material.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Formulario5 extends StatefulWidget {
  const Formulario5({Key? key}) : super(key: key);

  @override
  State<Formulario5> createState() => _Formulario5State();
}

class _Formulario5State extends State<Formulario5> {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Inscripciones",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  NavigationService.navigateTo(
                      Flurorouter.inscripcionMantenimiento);
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
