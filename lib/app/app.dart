import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/presentation/resources/routes_manager.dart';
import 'package:splashscreen/presentation/resources/theme_manager.dart';

import 'app_prefs.dart';
import 'dependency_injection.dart';

class App extends StatefulWidget {
  //name const
  const App.internal({super.key});

  final int appState = 0;
  //singleton or single instance
  static  const App _instance = App.internal();
  //factory
  factory App() => _instance;
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getAppTheme(),
    );
  }
}
