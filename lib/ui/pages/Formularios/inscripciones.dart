import 'package:flutter/material.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class InscripcionesConsulta extends StatefulWidget {
  const InscripcionesConsulta({Key? key}) : super(key: key);

  @override
  State<InscripcionesConsulta> createState() => _InscripcionesConsultaState();
}

class _InscripcionesConsultaState extends State<InscripcionesConsulta> {
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
                  // NavigationService.navigateTo(
                  //     Flurorouter.familiarMantenimiento);
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
          ),
        ],
      ),
    );
  }
}
