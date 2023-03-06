import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/profesor/profesor_provider.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/widget/customLabels.dart';
import 'package:tesis/ui/pages/widget/inputForm.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final provProfesor = Provider.of<ProfesorProvider>(context);
    // final provHorario = Provider.of<HorarioProvider>(context);
    return SingleChildScrollView(
      child: WhiteCard(
        title: "Mantenimiento de Profesores",
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text("Identificación :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provProfesor.ctrIdentificacion,
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
                    child: Text("Nombres :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provProfesor.ctrNombres,
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
                    child: Text("Apellidos :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provProfesor.ctrApellidos,
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
                    child: Text("Celular :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provProfesor.ctrCelular,
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
                    child: Text("Correo :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provProfesor.ctrCorreo,
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
                    child: Text("Domicilio :", style: CustomLabels.h11),
                  ),
                  Expanded(
                    child: InputForm(
                      controller: provProfesor.ctrDomicilio,
                      hint: "",
                      icon: Icons.assignment,
                      length: 500,
                      textInputType: TextInputType.text,
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
                rows: provProfesor.lisHorarios.map<DataRow>((e) {
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
                    var ass = await provProfesor.guardar(provProfesor
                        .lisHorarios
                        .where((e) => e.check)
                        .toList());
                    if (ass) {
                      setState(() {});
                      NavigationService.navigateTo(Flurorouter.formulario3);
                    }
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
