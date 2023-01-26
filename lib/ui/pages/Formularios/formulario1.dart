import 'package:flutter/material.dart';
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
      title: "Formulario 1",
      child: Column(
        children: [],
      ),
    );
  }
}
