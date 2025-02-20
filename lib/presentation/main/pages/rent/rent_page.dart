import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_impl.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/launch_manager.dart';
import '../../../resources/strings_manager.dart';


class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  RentPageState createState() => RentPageState();
}

class RentPageState extends State<RentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.pink,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 100,
                width: 230,
                child: GestureDetector(
                    onTap: () async {
                      var urllaunchable = await canLaunchUrl(AppLaunchUrl
                          .emailLaunchUri); //canLaunch is from url_launcher package
                      if (urllaunchable) {
                        await launchUrl(AppLaunchUrl
                            .emailLaunchUri); //launch is from url_launcher package to launch URL
                      } else {
                        ErrorState(StateRendererType.fullScreenErrorState,
                            AppStrings.defaultError);
                      }
                    }, child: Lottie.asset(JsonAssets.mailLogo))),
            SizedBox(
              height: 100,
              width: 230,
              child: GestureDetector(
                  onTap: () async {
                    var urllaunchable = await canLaunchUrl(AppLaunchUrl
                        .whatsappUrl); //canLaunch is from url_launcher package
                    if (urllaunchable) {
                      await launchUrl(AppLaunchUrl
                          .whatsappUrl); //launch is from url_launcher package to launch URL
                    } else {
                      ErrorState(StateRendererType.fullScreenErrorState,
                          AppStrings.defaultError);
                    }
                  },
                  child: Lottie.asset(JsonAssets.whatsAppLogo)),
            )
          ],
        ),
      ),
    );
  }
}
