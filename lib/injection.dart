import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tesis/domain/providers/CrearCita/CitaProvider.dart';
import 'package:tesis/domain/providers/Login/LoginProvider.dart';
import 'package:tesis/domain/providers/asistencias_provider.dart';
import 'package:tesis/domain/providers/cursos/cursos_provider.dart';
import 'package:tesis/domain/providers/disciplinas/Disciplina_Provider.dart';
import 'package:tesis/domain/providers/enfermeras/enfermeraProvider.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/domain/providers/informes/ingresoReporteProvider.dart';
import 'package:tesis/domain/providers/profesor/profesor_provider.dart';
import 'package:tesis/domain/providers/reportProvider.dart';
import 'package:tesis/domain/providers/usuario/usuario_Provider.dart';

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
  sl.registerFactory(() => FamiliaresProvider());
  sl.registerFactory(() => InscripcionProvider());
  sl.registerFactory(() => UsuarioProvider());
  sl.registerFactory(() => AsistenciasProvider());
  sl.registerFactory(() => CurosProvider());

  sl.registerLazySingleton(() => http.Client());
}
