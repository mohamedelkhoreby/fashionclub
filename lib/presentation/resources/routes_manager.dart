import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/dependency_injection.dart';
import '../main/main_view.dart';
import '../onboarding/view/boarding.dart';
import '../shimmer/shimmer.dart';
import 'strings_manager.dart';

class Routes {
  static const String shimmerRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String boarding = "/boarding";
  static const String mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.shimmerRoute:
        return MaterialPageRoute(builder: (_) => const ShimmerView());
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
            title: Text(AppStrings.noRouteFound.tr()),
          ),
          body: Center(child: Text(AppStrings.noRouteFound.tr()))),
    );
  }
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

Future<dynamic> push(
  String named,
) {
  return Navigator.pushNamed(
    navigator.currentContext!,
    named,
  );
}

Future<dynamic> replacement(
  String named,
) {
  return Navigator.of(navigator.currentContext!).pushReplacementNamed(named);
}

Future<dynamic> pushAndRemoveUntil(String named) {
  return Navigator.of(navigator.currentContext!).pushNamedAndRemoveUntil(
    named,
    (route) => false,
  );
}
