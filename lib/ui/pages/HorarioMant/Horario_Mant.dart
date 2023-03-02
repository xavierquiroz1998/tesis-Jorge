import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/data/model/catalogoModel.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class HorarioMantenimiento extends StatefulWidget {
  const HorarioMantenimiento({Key? key}) : super(key: key);

  @override
  State<HorarioMantenimiento> createState() => _HorarioMantenimientoState();
}

class _HorarioMantenimientoState extends State<HorarioMantenimiento> {
  @override
  void initState() {
    super.initState();

    Provider.of<HorarioProvider>(context, listen: false).getCatalogos();
  }

  @override
  Widget build(BuildContext context) {
    final provHorario = Provider.of<HorarioProvider>(context);
    return WhiteCard(
      title: "Mantenimiento de Horarios",
      child: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Disciplina :", style: CustomLabels.h11),
                ),
                provHorario.listDisciplina.isNotEmpty
                    ? Expanded(
                        child: DropdownButton<ModelDisciplina>(
                          isExpanded: true,
                          //value: provHorario.infoDisciplina,
                          onChanged: (ModelDisciplina? newValue) {
                            setState(() {
                              provHorario.infoDisciplina = newValue!;
                            });
                          },

                          hint: Text(
                            provHorario.infoDisciplina.id == 0
                                ? ""
                                : provHorario.infoDisciplina.descripcion,
                            style: TextStyle(color: Colors.black),
                          ),
                          items: provHorario.listDisciplina
                              .map<DropdownMenuItem<ModelDisciplina>>(
                                  (ModelDisciplina value) {
                            return DropdownMenuItem<ModelDisciplina>(
                              value: value,
                              child: Text(
                                value.descripcion == ""
                                    ? "prueba"
                                    : value.descripcion,
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    : Container(),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Nivel :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provHorario.ctrNivel,
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
                  child: Text("Categoria :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: DropdownButton<ModelCatalogos>(
                    isExpanded: true,
                    onChanged: (ModelCatalogos? newValue) {
                      setState(() {
                        provHorario.infoCategoria = newValue!;
                      });
                    },
                    hint: Text(
                      provHorario.infoCategoria.id == 0
                          ? ""
                          : provHorario.infoCategoria.descripcion,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provHorario.listCategoria
                        .map<DropdownMenuItem<ModelCatalogos>>(
                            (ModelCatalogos value) {
                      return DropdownMenuItem<ModelCatalogos>(
                        value: value,
                        child: Text(
                          value.descripcion == ""
                              ? "prueba"
                              : value.descripcion,
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
                  child: Text("Ciclo :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: DropdownButton<ModelCatalogos>(
                    isExpanded: true,
                    onChanged: (ModelCatalogos? newValue) {
                      setState(() {
                        provHorario.infoCiclo = newValue!;
                      });
                    },
                    hint: Text(
                      provHorario.infoCiclo.id == 0
                          ? ""
                          : provHorario.infoCiclo.descripcion,
                      style: TextStyle(color: Colors.black),
                    ),
                    items: provHorario.listCiclo
                        .map<DropdownMenuItem<ModelCatalogos>>(
                            (ModelCatalogos value) {
                      return DropdownMenuItem<ModelCatalogos>(
                        value: value,
                        child: Text(
                          value.descripcion == ""
                              ? "prueba"
                              : value.descripcion,
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
                  child: Text("valor :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: InputForm(
                    controller: provHorario.ctrValor,
                    hint: "",
                    icon: Icons.assignment,
                    length: 10,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text("Hora Inicio :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: TextField(
                    controller: provHorario.ctrHoraInicio,
                    onTap: () async {
                      TimeOfDay? pickedDate = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(), //get today's date
                      );
                      if (pickedDate != null) {
                        setState(() {
                          provHorario.ctrHoraInicio.text =
                              pickedDate.hour.toString() +
                                  ":" +
                                  pickedDate.minute.toString();
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Text("Hora Fin :", style: CustomLabels.h11),
                ),
                Expanded(
                  child: TextField(
                    controller: provHorario.ctrHoraFin,
                    onTap: () async {
                      TimeOfDay? pickedDate = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(), //get today's date
                      );
                      if (pickedDate != null) {
                        setState(() {
                          provHorario.ctrHoraFin.text =
                              pickedDate.hour.toString() +
                                  ":" +
                                  pickedDate.minute.toString();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    var ass = await provHorario.guardarHorario();
                    if (ass) {
                      NavigationService.navigateTo(Flurorouter.formulario2);
                    }
                  },
                  child: Text("Guardar"),
                ),
                TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(Flurorouter.formulario2);
                  },
                  child: Text("Cancelar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
