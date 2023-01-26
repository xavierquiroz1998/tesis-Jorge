import 'package:fluro/fluro.dart';
import 'package:tesis/domain/repositories/Handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String login = "/login";
  static String inicio = "/inicio";
  static String pacientes = "/pacientes";
  static String citamedica = "/citas";
  static String ingresoReporte = "/IngresoReporte";
  static String pacienteMantenimineto = "/paciente";
  static String consultaReporte = "/ConsutarReporte";
  static String citas1 = "/Citas1";
  static String enfermera = "/Efermera";
  static String enfermeraMant = "/EfermeraMant";
  static String tablaReporte = "/TablaReporte";
  static String chat = "/ChatBot";
  // los nombres de las rutas no se pueden repetir
  // no van espacio

  static void configureRoutes() {
    router.define(login,
        handler: Handlers.login, transitionType: TransitionType.fadeIn);

    router.define(inicio,
        handler: Handlers.incio, transitionType: TransitionType.fadeIn);

    router.define(pacientes,
        handler: Handlers.pacientes, transitionType: TransitionType.fadeIn);

    router.define(citamedica,
        handler: Handlers.cita, transitionType: TransitionType.fadeIn);

    router.define(ingresoReporte,
        handler: Handlers.ingresoReporte,
        transitionType: TransitionType.fadeIn);

    router.define(pacienteMantenimineto,
        handler: Handlers.pacienteMantenimineto,
        transitionType: TransitionType.fadeIn);

    router.define(consultaReporte,
        handler: Handlers.consultaReporte,
        transitionType: TransitionType.fadeIn);

    router.define(enfermera,
        handler: Handlers.enfermera, transitionType: TransitionType.fadeIn);

    router.define(enfermeraMant,
        handler: Handlers.enfermeraMant, transitionType: TransitionType.fadeIn);

    router.define(citas1,
        handler: Handlers.citas1, transitionType: TransitionType.fadeIn);

    router.define(tablaReporte,
        handler: Handlers.tablaReporte, transitionType: TransitionType.fadeIn);

    router.define(chat,
        handler: Handlers.chat, transitionType: TransitionType.fadeIn);

    router.notFoundHandler = Handlers.noFound;
  }
}
