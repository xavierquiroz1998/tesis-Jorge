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
                Text("Disciplina :"),
                SizedBox(
                  height: 10,
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
                Text("Nivel :"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: TextField(
                  controller: provHorario.ctrNivel,
                )),
              ],
            ),
            Row(
              children: [
                Text("Categoria :"),
                SizedBox(
                  height: 10,
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
                Text("Ciclo :"),
                SizedBox(
                  height: 10,
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
                Text("Valor :"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: provHorario.ctrValor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Hora Inicio :"),
                SizedBox(
                  height: 10,
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
                Text("Hora Fin :"),
                SizedBox(
                  height: 10,
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
                    await provHorario.guardarHorario();
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
