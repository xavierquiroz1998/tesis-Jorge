import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/usuario/usuario_Provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';
import 'package:tesis/ui/style/utilview.dart';

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
            Row(children: [
              SizedBox(
                width: 120,
                child: Text("Tipo de Usuario :", style: CustomLabels.h11),
              ),
              Expanded(
                child: DropdownButton<String>(
                  isExpanded: true,
                  //value: provHorario.infoDisciplina,
                  onChanged: (String? newValue) {
                    setState(() {
                      provUsuarios.tipoUsuarioSelect = newValue!;
                    });
                  },

                  hint: Text(
                    provUsuarios.tipoUsuarioSelect,
                    style: TextStyle(color: Colors.black),
                  ),
                  items: provUsuarios.listTipoUsuario
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
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
                    if (provUsuarios.ctrIdentificacion.text == "") {
                      UtilView.messageDanger("Ingrese # de Identificación");
                      return;
                    }
                    if (provUsuarios.ctrUsuario.text == "") {
                      UtilView.messageDanger("Ingrese Usuario");
                      return;
                    }
                    if (provUsuarios.tipoUsuarioSelect == "") {
                      UtilView.messageDanger("Selecciones Tipo de Usuario");
                      return;
                    }
                    if (provUsuarios.ctrNombres.text == "") {
                      UtilView.messageDanger("Ingrese Nombres");
                      return;
                    }
                    if (provUsuarios.ctrDomicilio.text == "") {
                      UtilView.messageDanger("Ingrese Domicilio");
                      return;
                    }
                    if (provUsuarios.ctrCorreo.text == "") {
                      UtilView.messageDanger("Ingrese Correo");
                      return;
                    }
                    if (provUsuarios.ctrCelular.text == "") {
                      UtilView.messageDanger("Ingrese Celular");
                      return;
                    }
                    if (provUsuarios.ctrContrasenia.text == "") {
                      UtilView.messageDanger("Ingrese Contaseñia");
                      return;
                    }

                    bool result = await provUsuarios.guardarUsuario();
                    if (result) {
                      setState(() {});
                      NavigationService.navigateTo(Flurorouter.pacientes);
                    }
                  },
                  child: Text('Guardar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
