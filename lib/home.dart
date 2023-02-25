import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis/domain/Navigation/NavigationService.dart';
import 'package:tesis/domain/providers/CrearCita/CitaProvider.dart';
import 'package:tesis/domain/providers/Home/sideMenuProvider.dart';
import 'package:tesis/domain/providers/Login/LoginProvider.dart';
import 'package:tesis/domain/providers/enfermeras/enfermeraProvider.dart';
import 'package:tesis/domain/providers/familiares/familiares_provider.dart';
import 'package:tesis/domain/providers/horarios/Horarios_Provider.dart';
import 'package:tesis/domain/providers/incripciones/incripcion_provider.dart';
import 'package:tesis/domain/providers/informes/ingresoReporteProvider.dart';
import 'package:tesis/domain/providers/profesor/profesor_provider.dart';
import 'package:tesis/domain/providers/reportProvider.dart';
import 'package:tesis/injection.dart';
import 'package:tesis/ui/Router/FluroRouter.dart';
import 'package:tesis/ui/pages/NavBar/NavBar.dart';
import 'package:tesis/ui/pages/SiderBar/sideBar.dart';

import 'domain/providers/disciplinas/Disciplina_Provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<LoginProvider>()),
        ChangeNotifierProvider(create: (_) => sl<IngresoReporteProvider>()),
        ChangeNotifierProvider(create: (_) => sl<ReportProvider>()),
        ChangeNotifierProvider(create: (_) => sl<EnfermerProvider>()),
        ChangeNotifierProvider(create: (_) => sl<CitaProvider>()),
        ChangeNotifierProvider(create: (_) => sl<DisciplinaProvider>()),
        ChangeNotifierProvider(create: (_) => sl<HorarioProvider>()),
        ChangeNotifierProvider(create: (_) => sl<ProfesorProvider>()),
        ChangeNotifierProvider(create: (_) => sl<FamiliaresProvider>()),
        ChangeNotifierProvider(create: (_) => sl<InscripcionProvider>()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
      ],
      child: MaterialApp(
        title: 'asas',
        debugShowCheckedModeBanner: false,
        initialRoute: "/login",
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context1, child) {
          final logeo = Provider.of<LoginProvider>(context1);

          if (logeo.authStatus == AuthStatus.notAuthenticated) {
            return child!;
          } else {
            return HomePage(child: child!);
          }
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) SideBar(),
              Expanded(
                child: Column(
                  children: [
                    NavBar(),
                    Expanded(
                      child: widget.child,
                    ),
                  ],
                ),
              )
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController,
              builder: (context, _) => Stack(
                children: [
                  if (SideMenuProvider.menuOpen)
                    Opacity(
                      opacity: SideMenuProvider.opacity.value,
                      child: GestureDetector(
                        onTap: () {
                          SideMenuProvider.closeMenu();
                        },
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset(SideMenuProvider.movimiento.value, 0),
                    child: SideBar(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
