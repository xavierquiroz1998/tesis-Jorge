import 'package:darq/darq.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/cursos/cursos_provider.dart';
import 'package:tesis/domain/providers/disciplinas/Disciplina_Provider.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';
import 'package:tesis/ui/style/utilview.dart';

class CursosMantenimiento extends StatefulWidget {
  const CursosMantenimiento({Key? key}) : super(key: key);

  @override
  State<CursosMantenimiento> createState() => _CursosMantenimientoState();
}

class _CursosMantenimientoState extends State<CursosMantenimiento> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FamiliaresProvider>(context, listen: false).getFamiliares();
    Provider.of<DisciplinaProvider>(context, listen: false).getDisciplinas();
    Provider.of<HorarioProvider>(context, listen: false).getHorarios();
    Provider.of<CurosProvider>(context, listen: false).inicilizar();
  }

  @override
  Widget build(BuildContext context) {
    var provCursos = Provider.of<CurosProvider>(context);

    final provFamilia = Provider.of<FamiliaresProvider>(context);
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
                        provCursos.mesSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provCursos.mesSelect,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provCursos.listadoMeses
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
                    controller: provCursos.ctrDescripcion,
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
                  child: Text("Horarios :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: DropdownButton<ModelViewHorarios>(
                    isExpanded: true,
                    //value: provHorario.infoDisciplina,
                    onChanged: (ModelViewHorarios? newValue) {
                      setState(() {
                        provCursos.horariosSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provCursos.horariosSelect == null
                          ? ""
                          : provCursos.horariosSelect!.nomDisciplina +
                              " nivel: " +
                              provCursos.horariosSelect!.nivel +
                              " Horas: " +
                              provCursos.horariosSelect!.horario,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provHorario.lisHorarios
                        .where((element) => element.estado == "A")
                        .map<DropdownMenuItem<ModelViewHorarios>>(
                            (ModelViewHorarios value) {
                      return DropdownMenuItem<ModelViewHorarios>(
                        value: value,
                        child: Text(
                          value.nomDisciplina +
                              " nivel: " +
                              value.nivel +
                              " Horas: " +
                              value.horario,
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
                  child: Text("socio :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: DropdownButton<ModelFamiliares>(
                    isExpanded: true,
                    //value: provHorario.infoDisciplina,
                    onChanged: (ModelFamiliares? newValue) {
                      setState(() {
                        provCursos.socioSelect = newValue!;
                      });
                    },

                    hint: Text(
                      provCursos.socioSelect == null
                          ? ""
                          : provCursos.socioSelect!.nombres,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    if (provCursos.socioSelect == null &&
                        provCursos.horariosSelect == null) {
                      UtilView.messageDanger(
                          "Para Agregar un Socio primero Seleccione un Periodo y disciplina");
                    } else if (!provCursos.agregarDetalle()) {
                      UtilView.messageDanger(
                          "El Socio o Familiar agregado para este Periodo y disciplina");
                    }
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
                    label: Center(child: Text("Celular")),
                  ),
                  // const DataColumn(
                  //   label: Center(child: Text("Celular")),
                  // ),
                  // const DataColumn(
                  //   label: Center(child: Text("Horario")),
                  // ),
                  const DataColumn(
                    label: Center(child: Text("")),
                  ),
                ],
                rows: provCursos.detalles
                    .map(
                      (e) => DataRow(
                        //key: LocalKey(),
                        cells: <DataCell>[
                          DataCell(
                            Text(e.socioSelect == null
                                ? ""
                                : e.socioSelect!.identificacion),
                          ),
                          DataCell(
                            Text(e.socioSelect == null
                                ? ""
                                : e.socioSelect!.nombres),
                          ),
                          DataCell(
                            Text(e.socioSelect == null
                                ? ""
                                : e.socioSelect!.celular),
                          ),
                          // DataCell(
                          //   Text(e.horariosSelect == null
                          //       ? ""
                          //       : e.horariosSelect!.nivel),
                          // ),
                          // DataCell(
                          //   Text(e.horariosSelect == null
                          //       ? ""
                          //       : e.horariosSelect!.horario),
                          // ),
                          DataCell(TextButton.icon(
                              onPressed: () {
                                provCursos.detalles.remove(e);
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
                  onPressed: () {
                    NavigationService.navigateTo(Flurorouter.cursos);
                  },
                  child: Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () async {
                    if (provCursos.mesSelect == "") {
                      UtilView.messageDanger("Seleccione Periodo");
                      return;
                    }
                    if (provCursos.ctrDescripcion.text == "") {
                      UtilView.messageDanger("Ingrese Descripción");
                      return;
                    }
                    if (provCursos.horariosSelect == null) {
                      UtilView.messageDanger("Seleccione Horario");
                      return;
                    }
                    if (provCursos.detalles.count() == 0) {
                      UtilView.messageDanger("Agrege al menos un Socio");
                      return;
                    }
                    if (!await provCursos.existeCurso()) {
                      UtilView.messageDanger(
                          "Ya existe un Curso para el Periodo ${provCursos.mesSelect} y el Disciplina ${provCursos.horariosSelect!.nomDisciplina}");
                      return;
                    }
                    if (await provCursos.guardar()) {
                      setState(() {});
                      NavigationService.navigateTo(Flurorouter.cursos);
                    }
                  },
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
