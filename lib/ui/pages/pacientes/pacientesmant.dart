import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/usuario/usuario_Provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class PacienteMant extends StatefulWidget {
  const PacienteMant({Key? key}) : super(key: key);

  @override
  State<PacienteMant> createState() => _PacienteMantState();
}

class _PacienteMantState extends State<PacienteMant> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UsuarioProvider>(context, listen: false).getMenu();
  }

  @override
  Widget build(BuildContext context) {
    final provUsuarios = Provider.of<UsuarioProvider>(context);
    return SingleChildScrollView(
      child: WhiteCard(
        title: "Registro de Usuario",
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Identificación :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provUsuarios.ctrIdentificacion,
                    hint: "",
                    icon: Icons.assignment,
                    length: 500,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),

            Row(children: [
              SizedBox(
                width: 120,
                child: Text("Usuario :", style: CustomLabels.h11),
              ),
              Expanded(
                child: InputForm(
                  controller: provUsuarios.ctrUsuario,
                  hint: "",
                  icon: Icons.assignment,
                  length: 500,
                  textInputType: TextInputType.text,
                ),
              ),
            ]),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Nombres :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provUsuarios.ctrNombres,
                    hint: "",
                    icon: Icons.assignment,
                    length: 500,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Domicilio :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provUsuarios.ctrDomicilio,
                    hint: "",
                    icon: Icons.assignment,
                    length: 500,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("correo :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provUsuarios.ctrCorreo,
                    hint: "",
                    icon: Icons.assignment,
                    length: 500,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Celular :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provUsuarios.ctrCelular,
                    hint: "",
                    icon: Icons.assignment,
                    length: 500,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Contraseña :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provUsuarios.ctrContrasenia,
                    hint: "",
                    oscureText: true,
                    icon: Icons.assignment,
                    length: 500,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: DataTable(
                columns: <DataColumn>[
                  // const DataColumn(
                  //   label: Center(child: Text("Id")),
                  // ),
                  const DataColumn(
                    label: Center(child: Text("Menu")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Check")),
                  ),
                ],
                rows: provUsuarios.listadoMenu
                    .where((element) => element.estado == "A")
                    .toList()
                    .map<DataRow>((e) {
                  return DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>((states) {
                      if (e.estado != "A") {
                        return Colors.red.shade300;
                      }
                      return null;
                    }),
                    //key: LocalKey(),
                    cells: <DataCell>[
                      DataCell(
                        Text(e.descripcion),
                      ),
                      DataCell(Checkbox(
                        value: e.check,
                        onChanged: (value) {
                          e.check = value!;
                          setState(() {});
                        },
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  // padding: const EdgeInsets.all(20),
                  // textColor: Colors.white,
                  // color: Colors.blue,
                  onPressed: () {
                    NavigationService.navigateTo(Flurorouter.pacientes);
                  },
                  child: Text('Cancelar'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  // padding: const EdgeInsets.all(20),
                  // textColor: Colors.white,
                  // color: Colors.blue,
                  onPressed: () async {
                    bool result = await provUsuarios.guardarUsuario();
                    if (result) {
                      NavigationService.navigateTo(Flurorouter.pacientes);
                    }
                  },
                  child: Text('Guardar'),
                ),
              ],
            ),

            // ya avanza

            //yaaaaaaaa
          ],
        ),
      ),
    );
  }
}
