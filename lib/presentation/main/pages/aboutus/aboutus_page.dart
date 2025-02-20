import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_impl.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/launch_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';
import 'buttomSheet.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double sizedBoxWidth = screenWidth / 3.5;
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: const EdgeInsets.only(left: AppValues.v8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(AppStrings.titleConcept.tr(),
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: AppValues.v20)))),
        Padding(
          padding:
              const EdgeInsets.only(left: AppValues.v12, right: AppValues.v12),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              AppStrings.description_1.tr(),
              style: getRegularStyle4(
                  color: ColorManager.black, fontSize: AppValues.v10),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Container(
                      height: screenHeight / 2,
                      width: screenWidth / 2,
                      color: ColorManager.openPink),
                  Positioned(
                    top: AppValues.v10,
                    left: AppValues.v5,
                    child: buildContainer(screenWidth, AppValues.v60,
                        ColorManager.babyBlue, AppStrings.body1.tr()),
                  ),
                  Positioned(
                    top: AppValues.v80,
                    left: AppValues.v50,
                    child: buildContainer(screenWidth, AppValues.v60,
                        ColorManager.pink, AppStrings.body2.tr()),
                  ),
                  Positioned(
                    top: AppValues.v150,
                    left: AppValues.v5,
                    child: buildContainer(screenWidth, AppValues.v60,
                        ColorManager.babyBlue, AppStrings.body3.tr()),
                  ),
                  Positioned(
                    top: AppValues.v220,
                    left: AppValues.v50,
                    child: buildContainer(screenWidth, AppValues.v70,
                        ColorManager.pink, AppStrings.body4.tr()),
                  ),
                ])),
        Padding(
            padding: const EdgeInsets.only(left: AppValues.v8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(AppStrings.titleVision.tr(),
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: AppValues.v20)))),
        Align(
            alignment: Alignment.topLeft,
            child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Container(
                      height: (screenWidth / 2) + 180,
                      width: screenWidth,
                      color: ColorManager.openPink),
                  Positioned(
                    top: AppValues.v15,
                    left: AppValues.v15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildContainerImage(
                            sizedBoxWidth, screenWidth, ImageAssets.aboutUs1),
                        const SizedBox(width: AppValues.v8),
                        buildContainerImage(
                            sizedBoxWidth, screenWidth, ImageAssets.aboutUs2),
                        const SizedBox(width: AppValues.v8),
                        buildContainerImage(
                            sizedBoxWidth, screenWidth, ImageAssets.aboutUs3),
                      ],
                    ),
                  ),
                  Positioned(
                    top: AppValues.v130,
                    left: AppValues.v30,
                    child: Column(
                      children: [
                        buildContainer(screenWidth, AppValues.v150,
                            ColorManager.babyBlue, AppStrings.visionBody.tr()),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  height: AppValues.v50,
                                  width: AppValues.v50,
                                  child: GestureDetector(
                                      onTap: () async {
                                        var urllaunchable = await canLaunchUrl(
                                            AppLaunchUrl
                                                .instagramUrl); //canLaunch is from url_launcher package
                                        if (urllaunchable) {
                                          await launchUrl(AppLaunchUrl
                                              .instagramUrl); //launch is from url_launcher package to launch URL
                                        } else {
                                          ErrorState(
                                              StateRendererType
                                                  .fullScreenErrorState,
                                              AppStrings.defaultError);
                                        }
                                      },
                                      child:
                                          Lottie.asset(JsonAssets.instagram))),
                              SizedBox(
                                  height: AppValues.v35,
                                  width: AppValues.v35,
                                  child: GestureDetector(
                                      onTap: () async {
                                        var urllaunchable = await canLaunchUrl(
                                            AppLaunchUrl
                                                .twitterUrl); //canLaunch is from url_launcher package
                                        if (urllaunchable) {
                                          await launchUrl(AppLaunchUrl
                                              .twitterUrl); //launch is from url_launcher package to launch URL
                                        } else {
                                          ErrorState(
                                              StateRendererType
                                                  .fullScreenErrorState,
                                              AppStrings.defaultError);
                                        }
                                      },
                                      child: Lottie.asset(
                                        JsonAssets.twitter,
                                      )))
                            ]),
                      ],
                    ),
                  )
                ])),
        const SizedBox(height: AppValues.v35),
        Padding(
          padding: const EdgeInsets.all(AppValues.v10),
          child: Align(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: AppValues.v35,
                      width: AppValues.v130,
                      child: buildElevatedButton(AppStrings.faq, () {}),
                    ),
                    SizedBox(
                      height: AppValues.v35,
                      width: AppValues.v130,
                      child: buildElevatedButton(
                        AppStrings.contactUs,
                        () async {
                          var urllaunchable = await canLaunchUrl(AppLaunchUrl
                              .emailLaunchUri); //canLaunch is from url_launcher package
                          if (urllaunchable) {
                            await launchUrl(AppLaunchUrl
                                .contactEmailUri); //launch is from url_launcher package to launch URL
                          } else {
                            ErrorState(StateRendererType.fullScreenErrorState,
                                AppStrings.defaultError);
                          }
                        },
                      ),
                    ),
                  ])),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              bottomSheet(context);
            },
            child: Text(AppStrings.privacyTitle.tr(),
                style: TextStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s10,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.semiBold,
                    decoration: TextDecoration.underline)),
          ),
        ),
        const SizedBox(height: AppValues.v50),
      ]),
    );
  }

  ElevatedButton buildElevatedButton(String text, function) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(ColorManager.black),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
      ),
      child: Text(text,
          style: getSemiBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s10,
          )),
    );
  }

  Container buildContainerImage(
      double sizedBoxWidth, double screenWidth, String assetImage) {
    return Container(
      width: sizedBoxWidth,
      height: screenWidth / AppValues.v3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container buildContainer(
      double screenWidth, double height, Color color, String text) {
    return Container(
      height: height,
      width: (screenWidth / AppValues.v2) + AppValues.v100,
      decoration: BoxDecoration(
        border: Border.all(color: color, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(AppValues.v2),
        color: color,
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: AppValues.v3),
        child: Text(
          text,
          style: getRegularStyle(
              color: ColorManager.black, fontSize: AppValues.v9),
        ),
      )),
    );
  }
}
