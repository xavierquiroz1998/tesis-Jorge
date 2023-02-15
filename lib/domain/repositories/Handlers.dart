import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/providers/Home/sideMenuProvider.dart';
import 'package:tesis/domain/providers/Login/LoginProvider.dart';
import 'package:tesis/ui/Citasss/Citas1.dart';
import 'package:tesis/ui/Lista/TablaReporte.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/chat/chatBot.dart';
import 'package:tesis/ui/pages/404/noFound.dart';
import 'package:tesis/ui/pages/ConsultaReporte/ConsultaReporte.dart';
import 'package:tesis/ui/pages/DisciplinaMant/Disciplina_Mant.dart';
import 'package:tesis/ui/pages/Formularios/formulario1.dart';
import 'package:tesis/ui/pages/Formularios/formulario2.dart';
import 'package:tesis/ui/pages/Formularios/formulario3.dart';
import 'package:tesis/ui/pages/Formularios/formulario4.dart';
import 'package:tesis/ui/pages/Formularios/formulario5.dart';
import 'package:tesis/ui/pages/HorarioMant/Horario_Mant.dart';
import 'package:tesis/ui/pages/ProfesorMant/Profesor_Mant.dart';
import 'package:tesis/ui/pages/ProfesorMant/profe_x_horario.dart';
import 'package:tesis/ui/pages/enfermera/enfermera.dart';
import 'package:tesis/ui/pages/enfermera/enfermeras.dart';
import 'package:tesis/ui/pages/familiaresMant/Familiares_Mant.dart';
import 'package:tesis/ui/pages/home/Cita%20medica.dart';
import 'package:tesis/ui/pages/home/Listado%20de%20pacientes.dart';
import 'package:tesis/ui/pages/home/citas.dart';
import 'package:tesis/ui/pages/home/inicio.dart';
import 'package:tesis/ui/pages/informes/Ingresoreporte1.dart';
import 'package:tesis/ui/pages/inscripcionesMant/Inscripciones_Mant.dart';
import 'package:tesis/ui/pages/login/Login.dart';
import 'package:tesis/ui/pages/pacientes/pacientesmant.dart';

class Handlers {
  static Handler login = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    return LoginView();
  });

  static Handler incio = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.inicio);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return Inicio();
    } else {
      return LoginView();
    }
  });

  static Handler cita = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.citamedica);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return CitaCons();
    } else {
      return LoginView();
    }
  });

  static Handler pacientes = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.pacientes);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return PacientesConsulta();
    } else {
      return LoginView();
    }
  });

  static Handler ingresoReporte = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.ingresoReporte);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return Ingresoreporte1();
    } else {
      return LoginView();
    }
  });

  static Handler pacienteMantenimineto = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.pacienteMantenimineto);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return PacienteMant();
    } else {
      return LoginView();
    }
  });

  static Handler consultaReporte = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.consultaReporte);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return ConsultaReporte();
    } else {
      return LoginView();
    }
  });

  static Handler citas1 = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.citas1);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return Citas1();
    } else {
      return LoginView();
    }
  });

  static Handler enfermera = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.enfermera);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return EnfermerasCons();
    } else {
      return LoginView();
    }
  });

  static Handler enfermeraMant = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.enfermeraMant);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return Enfermera();
    } else {
      return LoginView();
    }
  });

  static Handler chat = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.chat);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return ChatBot();
    } else {
      return LoginView();
    }
  });

  static Handler tablaReporte = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.tablaReporte);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return TablaReporte();
    } else {
      return LoginView();
    }
  });

  static Handler formulario1 = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario1);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const Formulario1();
    } else {
      return const LoginView();
    }
  });
  static Handler formulario2 = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario2);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const Formulario2();
    } else {
      return const LoginView();
    }
  });
  static Handler formulario3 = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario3);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const Formulario3();
    } else {
      return const LoginView();
    }
  });
  static Handler formulario4 = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario4);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const Formulario4();
    } else {
      return const LoginView();
    }
  });
  static Handler formulario5 = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario5);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const Formulario5();
    } else {
      return const LoginView();
    }
  });

  static Handler disciplinaMant = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario1);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const DisciplinaMantenimiento();
    } else {
      return const LoginView();
    }
  });

  static Handler horarioMant = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario2);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const HorarioMantenimiento();
    } else {
      return const LoginView();
    }
  });

  static Handler profesorMant = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario3);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const ProfesorMantenimiento();
    } else {
      return const LoginView();
    }
  });

  static Handler familiarMant = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario4);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const FamiliaresMantenimiento();
    } else {
      return const LoginView();
    }
  });

  static Handler inscripcioinesMant = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.formulario5);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const InscripcionesMantenimiento();
    } else {
      return const LoginView();
    }
  });

  static Handler profesorXhorario = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    final logeo = Provider.of<LoginProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.profesorXhorario);
    if (logeo.authStatus == AuthStatus.authenticated) {
      return const ProfesorXhorario();
    } else {
      return const LoginView();
    }
  });

  static Handler noFound = Handler(handlerFunc: (context, param) {
    // validacion de sesion
    return NoPageFoundView();
  });
}
