import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
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
                Expanded(
                  child: provHorario.listDisciplina.isNotEmpty
                      ? DropdownButton<ModelDisciplina>(
                          //value: provHorario.infoDisciplina,
                          onChanged: (ModelDisciplina? newValue) {
                            setState(() {
                              provHorario.infoDisciplina = newValue!;
                            });
                          },
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
                        )
                      : Container(),
                ),
              ],
            ),
            Row(
              children: [
                Text("Nivel :"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextFormField(),
                ),
              ],
            ),
            Row(
              children: [
                Text("Tiempo  :"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextFormField(),
                ),
              ],
            ),
            Row(
              children: [
                Text("Categoria :"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextFormField(),
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
                  child: TextFormField(),
                ),
              ],
            ),
            Row(
              children: [
                Text("Horario :"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextFormField(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
