import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/app/dependency_injection.dart';
import 'package:splashscreen/presentation/onBoarding/view/boarding.dart';
import 'package:splashscreen/presentation/resources/strings_manager.dart';

import '../Login/view/login_view.dart';
import '../forgot_password/view/forgot_password_view.dart';
import '../main/main_view.dart';
import '../register/view/register_view.dart';
import '../splash/splash.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String boarding = "/boarding";
  static const String mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.boarding:
        return MaterialPageRoute(builder: (_) => const Boarding());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
          appBar: AppBar(
            title:  Text(AppStrings.noRouteFound.tr()),
          ),
          body: Center(child: Text(AppStrings.noRouteFound.tr()))),
    );
  }
}
