import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/domain/providers/profesor/profesor_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/whiteCard.dart';

class ProfesorMantenimiento extends StatefulWidget {
  const ProfesorMantenimiento({Key? key}) : super(key: key);

  @override
  State<ProfesorMantenimiento> createState() => _ProfesorMantenimientoState();
}

class _ProfesorMantenimientoState extends State<ProfesorMantenimiento> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfesorProvider>(context, listen: false).inicializacion();

    Provider.of<HorarioProvider>(context, listen: false)
        .getHorarios_x_profesor();
  }

  @override
  Widget build(BuildContext context) {
    final provProfesor = Provider.of<ProfesorProvider>(context);
    final provHorario = Provider.of<HorarioProvider>(context);
    return WhiteCard(
      title: "Mantenimiento de Profesores",
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("# de Identificación :"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: provProfesor.ctrIdentificacion,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Nombre de Profesor :"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: provProfesor.ctrNombres,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Apellidos de Profesor :"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: provProfesor.ctrApellidos,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Celular de Profesor :"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: provProfesor.ctrCelular,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Correo de Profesor :"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: provProfesor.ctrCorreo,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("domicilio de Profesor :"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: provProfesor.ctrDomicilio,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: DataTable(
                columns: <DataColumn>[
                  const DataColumn(
                    label: Center(child: Text("Check")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Disciplina")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Nivel")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Categoria")),
                  ),
                  const DataColumn(
                    label: Center(child: Text("Ciclo")),
                  ),
                   DataColumn(
                    label: Center(child: Text("Horario")),
                  ),
                  
                ],
                rows: provHorario.lisHorarios.map<DataRow>((e) {
                  return DataRow(
                    //key: LocalKey(),
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                            value: e.check,
                            onChanged: (value) {
                              e.check = value!;
                              setState(() {});
                            }),
                      ),
                      DataCell(
                        Text(e.nomDisciplina),
                      ),
                      DataCell(
                        Text(e.nivel),
                      ),
                      DataCell(
                        Text(e.nomCategoria),
                      ),
                      DataCell(
                        Text(e.nomCiclo),
                      ),
                      
                      DataCell(
                        Text(e.horario),
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
                  onPressed: () async {
                    await provProfesor.guardar(provHorario.lisHorarios.where((e) => e.check).toList());
                  },
                  child: Text("Guardar"),
                ),
                TextButton(
                  onPressed: () {
                    NavigationService.navigateTo(Flurorouter.formulario3);
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
