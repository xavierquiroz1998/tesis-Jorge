import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tesis/domain/providers/CrearCita/CitaProvider.dart';
import 'package:tesis/domain/providers/Login/LoginProvider.dart';
import 'package:tesis/domain/providers/disciplinas/Disciplina_Provider.dart';
import 'package:tesis/domain/providers/enfermeras/enfermeraProvider.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/domain/providers/informes/ingresoReporteProvider.dart';
import 'package:tesis/domain/providers/profesor/profesor_provider.dart';
import 'package:tesis/domain/providers/reportProvider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoginProvider());
  sl.registerFactory(() => IngresoReporteProvider());
  sl.registerFactory(() => ReportProvider());
  sl.registerFactory(() => EnfermerProvider());
  sl.registerFactory(() => CitaProvider());
  sl.registerFactory(() => DisciplinaProvider());
  sl.registerFactory(() => HorarioProvider());
  sl.registerFactory(() => ProfesorProvider());

  sl.registerLazySingleton(() => http.Client());
}
