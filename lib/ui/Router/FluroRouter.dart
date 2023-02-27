import 'package:fluro/fluro.dart';
import 'package:tesis/domain/repositories/Handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String login = "/login";
  static String inicio = "/inicio";
  static String pacientes = "/pacientes";
  static String citamedica = "/citas";
  static String ingresoReporte = "/IngresoReporte";
  static String pacienteMantenimineto = "/usuarios";
  static String consultaReporte = "/ConsutarReporte";
  static String citas1 = "/Citas1";
  static String enfermera = "/Efermera";
  static String enfermeraMant = "/EfermeraMant";
  static String tablaReporte = "/TablaReporte";
  static String chat = "/ChatBot";
  static String formulario1 = "/formulario1";
  static String formulario2 = "/formulario2";
  static String formulario3 = "/formulario3";
  static String formulario4 = "/formulario4";
  static String formulario5 = "/formulario5";

  static String disciplinaMantenimiento = "/disciplinaMant";
  static String horarioMantenimiento = "/horarioMant";
  static String profesorMantenimiento = "/profesorMant";
  static String familiarMantenimiento = "/familiarMant";
  static String inscripcionMantenimiento = "/inscripcionMant";
  static String profesorXhorario = "/profesorXhorario";
  static String aprobacion = "/aprobacion";
  static String asistencias = "/asistencias";
  static String asistenciasMant = "/asistenciasMant";
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
    router.define(formulario1,
        handler: Handlers.formulario1, transitionType: TransitionType.fadeIn);
    router.define(formulario2,
        handler: Handlers.formulario2, transitionType: TransitionType.fadeIn);
    router.define(formulario3,
        handler: Handlers.formulario3, transitionType: TransitionType.fadeIn);
    router.define(formulario4,
        handler: Handlers.formulario4, transitionType: TransitionType.fadeIn);
    router.define(formulario5,
        handler: Handlers.formulario5, transitionType: TransitionType.fadeIn);

    router.define(disciplinaMantenimiento,
        handler: Handlers.disciplinaMant,
        transitionType: TransitionType.fadeIn);
    router.define(horarioMantenimiento,
        handler: Handlers.horarioMant, transitionType: TransitionType.fadeIn);
    router.define(profesorMantenimiento,
        handler: Handlers.profesorMant, transitionType: TransitionType.fadeIn);
    router.define(familiarMantenimiento,
        handler: Handlers.familiarMant, transitionType: TransitionType.fadeIn);
    router.define(inscripcionMantenimiento,
        handler: Handlers.inscripcioinesMant,
        transitionType: TransitionType.fadeIn);

    router.define(profesorXhorario,
        handler: Handlers.profesorXhorario,
        transitionType: TransitionType.fadeIn);

    router.define(aprobacion,
        handler: Handlers.aprobacionSocio,
        transitionType: TransitionType.fadeIn);

    router.define(asistencias,
        handler: Handlers.asistenciasSocios,
        transitionType: TransitionType.fadeIn);
   
    router.define(asistenciasMant,
        handler: Handlers.asistenciasSociosMant,
        transitionType: TransitionType.fadeIn);

    router.notFoundHandler = Handlers.noFound;
  }
}
