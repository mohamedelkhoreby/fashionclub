import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splashscreen/presentation/resources/color_manager.dart';
import 'package:splashscreen/presentation/resources/font_manager.dart';
import 'package:splashscreen/presentation/resources/routes_manager.dart';
import 'package:splashscreen/presentation/resources/strings_manager.dart';
import 'package:splashscreen/presentation/resources/style_manager.dart';

import '../../app/app_prefs.dart';
import '../../app/dependency_injection.dart';
import '../resources/assets_manager.dart';
import '../resources/constant_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {Navigator.pushReplacementNamed(context, Routes.mainRoute)}
          else
            {
              _appPreferences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute)
                          }
                        else
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.boarding)
                          }
                      })
            }
        });
    Navigator.pushReplacementNamed(context, Routes.boarding);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.black,
        body: Center(
          child: Column(children: <Widget>[
            const Expanded(
                child: Center(
              child: Image(image: AssetImage(ImageAssets.splashLogo)),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                AppStrings.appName,
                style: getLightStyle(
                    color: ColorManager.white, fontSize: FontSize.s25),
              ),
            )
          ]),
        ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
