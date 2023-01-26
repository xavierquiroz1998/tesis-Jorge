import 'package:flutter/material.dart';
import 'package:tesis/domain/providers/Home/sideMenuProvider.dart';
import 'package:tesis/ui/pages/NavBarAvatar/NavBarAvatar.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      //color: Colors.red,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700) ...[
            IconButton(
                onPressed: () {
                  SideMenuProvider.openMenu();
                },
                icon: Icon(Icons.menu_outlined)),
          ],

          // icono de menu

          // buscar
          // if (size.width > 400)
          //   ConstrainedBox(
          //     constraints: BoxConstraints(maxWidth: 250),
          //     child: SearchText(),
          //   ),
          Spacer(),
          NavBarAvatar(),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() =>
      BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 5),
      ]);
}
