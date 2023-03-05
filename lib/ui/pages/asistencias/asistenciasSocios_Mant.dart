import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/data/model/horarios.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/asistencias_provider.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';
import 'package:tesis/ui/style/Custom_Inputs.dart';
import 'package:tesis/ui/style/utilview.dart';

class AsistenciaSociosMant extends StatefulWidget {
  const AsistenciaSociosMant({Key? key}) : super(key: key);

  @override
  State<AsistenciaSociosMant> createState() => _AsistenciaSociosMantState();
}

class _AsistenciaSociosMantState extends State<AsistenciaSociosMant> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FamiliaresProvider>(context, listen: false).getFamiliares();
    Provider.of<HorarioProvider>(context, listen: false).getHorarios();
    Provider.of<AsistenciasProvider>(context, listen: false).inicializar();
  }

  @override
  Widget build(BuildContext context) {
    final provHorario = Provider.of<HorarioProvider>(context);
    final provAsistencia = Provider.of<AsistenciasProvider>(context);
    return WhiteCard(
      title: "Asistencia de Socios",
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text("Fecha :", style: CustomLabels.h11),
              ),
              Expanded(
                child: TextField(
                  controller: provAsistencia.ctrFecha,
                  decoration: CustomInputs.boxInputDecoration3(
                      label: "Fecha de Asistencia", icon: Icons.calendar_today),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);

                      setState(() {
                        provAsistencia.ctrFecha.text = formattedDate;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
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
                      provAsistencia.mesSelect = newValue!;
                      provAsistencia.cargarSocios(
                          provAsistencia.mesSelect,
                          provAsistencia.infoDisciplina == null
                              ? 0
                              : provAsistencia.infoDisciplina!.id);
                    });
                  },

                  hint: Text(
                    provAsistencia.mesSelect,
                    style: TextStyle(color: Colors.black),
                  ),
                  items: provAsistencia.listadoMeses
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
                child: Text("Horarios :", style: CustomLabels.h11),
              ),
              Expanded(
                child: DropdownButton<ModelViewHorarios>(
                  isExpanded: true,
                  //value: provHorario.infoDisciplina,
                  onChanged: (ModelViewHorarios? newValue) {
                    setState(() {
                      provAsistencia.infoDisciplina = newValue!;
                    });
                    provAsistencia.cargarSocios(
                        provAsistencia.mesSelect,
                        provAsistencia.infoDisciplina == null
                            ? 0
                            : provAsistencia.infoDisciplina!.id);
                  },

                  hint: Text(
                    provAsistencia.infoDisciplina == null
                        ? ""
                        : provAsistencia.infoDisciplina!.nomDisciplina,
                    style: TextStyle(color: Colors.black),
                  ),
                  items: provHorario.lisHorarios
                      .map<DropdownMenuItem<ModelViewHorarios>>(
                          (ModelViewHorarios value) {
                    return DropdownMenuItem<ModelViewHorarios>(
                      value: value,
                      child: Text(
                        value.nomDisciplina == "" ? "" : value.nomDisciplina,
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
                  controller: provAsistencia.ctrDescripcion,
                  hint: "",
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
                  label: Center(child: Text("# Identificación")),
                ),
                const DataColumn(
                  label: Center(child: Text("Nombres")),
                ),
                const DataColumn(
                  label: Center(child: Text("Asistencia")),
                ),
                const DataColumn(
                  label: Center(child: Text("Falta Justificada")),
                ),
                const DataColumn(
                  label: Center(child: Text("Retraso")),
                )
              ],
              rows: provAsistencia.listDetalle.map<DataRow>((e) {
                return DataRow(
                  //key: LocalKey(),
                  cells: <DataCell>[
                    DataCell(
                      Text(e.identificacion),
                    ),
                    DataCell(
                      Text(e.nombres),
                    ),
                    DataCell(
                      Checkbox(
                        value: e.asistencia,
                        onChanged: (value) {
                          if (!e.faltaJustificada && !e.atraso) {
                            e.asistencia = value!;
                          }

                          setState(() {});
                        },
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: e.faltaJustificada,
                        onChanged: (value) {
                          if (!e.asistencia && !e.atraso) {
                            e.faltaJustificada = value!;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: e.atraso,
                        onChanged: (value) {
                          if (!e.asistencia && !e.faltaJustificada) {
                            e.atraso = value!;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  NavigationService.navigateTo(Flurorouter.asistencias);
                },
                child: Text("Cancelar"),
              ),
              TextButton(
                onPressed: () async {
                  if (provAsistencia.ctrFecha.text == "") {
                    UtilView.messageDanger("Seleccione un Fecha");
                    return;
                  }
                  if (provAsistencia.mesSelect == "") {
                    UtilView.messageDanger("Seleccione un Periodo");
                    return;
                  }

                  if (provAsistencia.infoDisciplina == null) {
                    UtilView.messageDanger("Seleccione un Horario");
                    return;
                  }

                  if (provAsistencia.ctrDescripcion.text == "") {
                    UtilView.messageDanger("Ingrese una Descripción");
                    return;
                  }

                  if (provAsistencia.listDetalle.count() == 0) {
                    UtilView.messageDanger(
                        "No hay información de asistencia para este Periodo y Horario, Por favor Seleccione otro Periodo o Horario");
                    return;
                  }

                  if (provAsistencia.listDetalle
                          .where((e) =>
                              e.asistencia || e.faltaJustificada || e.atraso)
                          .toList()
                          .count() ==
                      0) {
                    UtilView.messageDanger(
                        "Ingrese Asistencia de los Socios o Familiares");
                    return;
                  }

                  if (await provAsistencia.guardar()) {
                    UtilView.messageSnackNewAccess(
                        "Asistencia Guardada \ncon exito", context);
                    NavigationService.navigateTo(Flurorouter.asistencias);
                  }
                },
                child: Text("Guardar"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
