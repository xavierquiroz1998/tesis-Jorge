import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';
import 'package:tesis/ui/style/utilview.dart';

class FamiliaresMantenimiento extends StatefulWidget {
  const FamiliaresMantenimiento({Key? key}) : super(key: key);

  @override
  State<FamiliaresMantenimiento> createState() =>
      _FamiliaresMantenimientoState();
}

class _FamiliaresMantenimientoState extends State<FamiliaresMantenimiento> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FamiliaresProvider>(context, listen: false).inicializacion();
  }

  @override
  Widget build(BuildContext context) {
    var provFamiliares = Provider.of<FamiliaresProvider>(context);
    return SingleChildScrollView(
      child: WhiteCard(
        title: "Familiares o Invitados",
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text("Codigo :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provFamiliares.ctrCodigoSocio,
                      hint: "",
                      icon: Icons.assignment,
                      length: 10,
                      textInputType: TextInputType.text,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text("Buscar")),
                  SizedBox(
                    width: 120,
                    child: Text("Datos del Socio :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provFamiliares.ctrNombresSocio,
                      hint: "",
                      icon: Icons.assignment,
                      length: 500,
                      textInputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                      width: 120,
                      child: Text("# Identificación", style: CustomLabels.h11)),
                  Expanded(
                    child: InputForm(
                      controller: provFamiliares.ctrIdentificacion,
                      hint: "",
                      icon: Icons.assignment,
                      length: 20,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text("Nombres y Apellidos", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provFamiliares.ctrNombres,
                      hint: "",
                      icon: Icons.assignment,
                      length: 500,
                      textInputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child:
                        Text("Tipo de Beneficiario :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      //value: provHorario.infoDisciplina,
                      onChanged: (String? newValue) {
                        setState(() {
                          provFamiliares.tipoSlect = newValue!;
                        });
                      },

                      hint: Text(
                        provFamiliares.tipoSlect,
                        style: TextStyle(color: Colors.black),
                      ),
                      items: provFamiliares.tipos
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text("Celular :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provFamiliares.ctrCelular,
                      hint: "",
                      icon: Icons.assignment,
                      length: 10,
                      textInputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text("Correo :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provFamiliares.ctrCorreo,
                      hint: "",
                      icon: Icons.assignment,
                      length: 200,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text("Domicilio :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provFamiliares.ctrDomicilio,
                      hint: "",
                      icon: Icons.assignment,
                      length: 500,
                      textInputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text("Cargar Imagen :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: TextFormField(
                      enabled: true,
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          // provFamiliares.imagen =
                          //     utf8.decode(result.files.first.bytes!);
                          // PlatformFile file = result.files.first;
                          // // print(file.path!);
                          // File file = File(result.files.first.path!);
                          // Uint8List imgbytes = file.readAsBytesSync();
                          provFamiliares.imagen =
                              base64Encode(result.files.first.bytes!);
                        } else {
                          // User canceled the pickerb
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      var ass = await provFamiliares.garabar();
                      if (ass) {
                        setState(() {});
                        UtilView.messageSnackNewAccess(
                            "Familiar Registrado \ncon exito", context);
                      }
                      NavigationService.navigateTo(Flurorouter.formulario4);
                    },
                    child: Text("Guardar"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      NavigationService.navigateTo(Flurorouter.formulario4);
                    },
                    child: Text("Cancelar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
