import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/data/model/disciplinaModel.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final provFamilia = Provider.of<FamiliaresProvider>(context);
    final provHorario = Provider.of<HorarioProvider>(context);
    return WhiteCard(
      title: "Asistencia de Socios",
      child: Column(
        children: [
          Row(
            children: [
              Text("Disciplina :"),
              SizedBox(
                height: 10,
              ),
              Expanded(
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
                        value.descripcion == "" ? "prueba" : value.descripcion,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
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
                  label: Center(child: Text("Tipo")),
                ),
                const DataColumn(
                  label: Center(child: Text("Celular")),
                ),
                const DataColumn(
                  label: Center(child: Text("Estado")),
                ),
                const DataColumn(
                  label: Center(child: Text("")),
                )
              ],
              rows: provFamilia.listado
                  .where((element) => element.estado == "A")
                  .map<DataRow>((e) {
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
                      Text(e.tipo),
                    ),
                    DataCell(
                      Text(e.celular),
                    ),
                    DataCell(
                      Text(e.estado),
                    ),
                    DataCell(Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
