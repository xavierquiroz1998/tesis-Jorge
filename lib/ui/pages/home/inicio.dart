import 'package:flutter/material.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: "Menu Principal",
      child: Column(
        children: [
          Row(
            children: [],
          ), //Text("esto es una columna 1"),
        ],
      ),
    );
  }
}
