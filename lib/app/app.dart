import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constants/app_router.dart';
import '../constants/constants.dart';
import 'permission_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider.value(
      value: PermissionProvider(),
      child: MaterialApp.router(
        title: appName,
        theme: ThemeData.light().copyWith(useMaterial3: true),
        darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
        themeMode: ThemeMode.system,
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
      ),
    );
  }
}
