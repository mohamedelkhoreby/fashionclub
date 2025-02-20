import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';
import 'app_prefs.dart';
import 'dependency_injection.dart';

class App extends StatefulWidget {
  //name const
  const App.internal({super.key});

  final int appState = 0;
  //singleton or single instance
  static const App _instance = App.internal();
  //factory
  factory App() => _instance;
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appPreferences.getLocal().then((local) {
      if (mounted) {
        context.setLocale(local);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.shimmerRoute,
      theme: getAppTheme(),
      navigatorKey: navigator,
    );
  }
}
