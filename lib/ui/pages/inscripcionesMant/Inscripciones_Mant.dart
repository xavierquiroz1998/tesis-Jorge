import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/domain/providers/disciplinas/Disciplina_Provider.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FamiliaresProvider>(context, listen: false).getFamiliares();
    Provider.of<DisciplinaProvider>(context, listen: false).getDisciplinas();
    Provider.of<HorarioProvider>(context, listen: false).getHorarios();
  }

  @override
  Widget build(BuildContext context) {
    var provInscripcion = Provider.of<InscripcionProvider>(context);
    final provFamilia = Provider.of<FamiliaresProvider>(context);
    final ptProvider = Provider.of<DisciplinaProvider>(context);
    final provHorario = Provider.of<HorarioProvider>(context);
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
                  child: DropdownButton<ModelFamiliares>(
                    isExpanded: true,
                    //value: provHorario.infoDisciplina,
                    onChanged: (ModelFamiliares? newValue) {
                      setState(() {
                        provInscripcion.socioSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provInscripcion.socioSelect == null
                          ? ""
                          : provInscripcion.socioSelect!.nombres,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provFamilia.listado
                        .where((element) => element.estado == "A")
                        .map<DropdownMenuItem<ModelFamiliares>>(
                            (ModelFamiliares value) {
                      return DropdownMenuItem<ModelFamiliares>(
                        value: value,
                        child: Text(
                          value.nombres,
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
                  child: DropdownButton<ModelViewHorarios>(
                    isExpanded: true,
                    //value: provHorario.infoDisciplina,
                    onChanged: (ModelViewHorarios? newValue) {
                      setState(() {
                        provInscripcion.disciplinaSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provInscripcion.disciplinaSelect == null
                          ? ""
                          : provInscripcion.disciplinaSelect!.nomDisciplina,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provHorario.lisHorarios
                        .where((element) => element.estado == "A")
                        .map<DropdownMenuItem<ModelViewHorarios>>(
                            (ModelViewHorarios value) {
                      return DropdownMenuItem<ModelViewHorarios>(
                        value: value,
                        child: Text(
                          value.nomDisciplina,
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
                  onPressed: () {
                    provInscripcion.agregarDetalle();
                  },
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
                  ),
                ],
                rows: provInscripcion.detalles
                    .map(
                      (e) => DataRow(
                        //key: LocalKey(),
                        cells: <DataCell>[
                          DataCell(
                            Text(e.socioSelect!.identificacion),
                          ),
                          DataCell(
                            Text(e.socioSelect!.nombres),
                          ),
                          DataCell(
                            Text(e.disciplinaSelect!.nomDisciplina),
                          ),
                          DataCell(
                            Text(e.disciplinaSelect!.nivel),
                          ),
                          DataCell(
                            Text(e.disciplinaSelect!.horario),
                          ),
                          DataCell(TextButton.icon(
                              onPressed: () {
                                provInscripcion.detalles.remove(e);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                              label: Text(""))),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Guardar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
