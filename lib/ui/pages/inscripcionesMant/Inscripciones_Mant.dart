import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class InscripcionesMantenimiento extends StatefulWidget {
  const InscripcionesMantenimiento({Key? key}) : super(key: key);

  @override
  State<InscripcionesMantenimiento> createState() =>
      _InscripcionesMantenimientoState();
}

class _InscripcionesMantenimientoState
    extends State<InscripcionesMantenimiento> {
  @override
  Widget build(BuildContext context) {
    var provInscripcion = Provider.of<InscripcionProvider>(context);
    return WhiteCard(
      title: "Mantenimiento de Inscripciones",
      child: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Periodo :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    //value: provHorario.infoDisciplina,
                    onChanged: (String? newValue) {
                      setState(() {
                        provInscripcion.mesSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provInscripcion.mesSelect,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provInscripcion.listadoMeses
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
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Descripción :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provInscripcion.ctrDescripcion,
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
                  child: Text("socio :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    //value: provHorario.infoDisciplina,
                    onChanged: (String? newValue) {
                      setState(() {
                        provInscripcion.mesSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provInscripcion.mesSelect,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provInscripcion.listadoMeses
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
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("disciplina :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    //value: provHorario.infoDisciplina,
                    onChanged: (String? newValue) {
                      setState(() {
                        provInscripcion.mesSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provInscripcion.mesSelect,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provInscripcion.listadoMeses
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
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Agregar"),
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
                    label: Center(child: Text("# Identificación")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Nombres del Socio")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Disciplina")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Nivel")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Horario")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("")),
                  )
                ],
                rows: [
                  DataRow(
                    //key: LocalKey(),
                    cells: <DataCell>[
                      DataCell(
                        Text(""),
                      ),
                      DataCell(
                        Text(""),
                      ),
                      DataCell(
                        Text(""),
                      ),
                      DataCell(
                        Text(""),
                      ),
                      DataCell(
                        Text(""),
                      ),
                      DataCell(
                        Text(""),
                      ),
                    ],
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
