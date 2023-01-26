import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tesis/domain/providers/CrearCita/CitaProvider.dart';
import 'package:tesis/domain/providers/Login/LoginProvider.dart';
import 'package:tesis/domain/providers/enfermeras/enfermeraProvider.dart';
import 'package:tesis/domain/providers/informes/ingresoReporteProvider.dart';
import 'package:tesis/domain/providers/reportProvider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoginProvider());
  sl.registerFactory(() => IngresoReporteProvider());
  sl.registerFactory(() => ReportProvider());
  sl.registerFactory(() => EnfermerProvider());
  sl.registerFactory(() => CitaProvider());

  sl.registerLazySingleton(() => http.Client());
}
