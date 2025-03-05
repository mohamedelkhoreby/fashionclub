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
    double baseFontSize = screenWidth * 0.05; // Adjust this value as needed

    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppValues.v8),
              child: Text(
                AppStrings.titleConcept.tr(),
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: baseFontSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.description_1.tr(),
                style: getRegularStyle4(
                    color: ColorManager.black, fontSize: baseFontSize * 0.5),
              ),
            ),
            Container(
              height: screenHeight / 2.3,
              width: screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorManager.openPink, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: screenHeight * 0.03,
                children: [
                  buildContainer(
                      screenWidth,
                      screenHeight * 0.08,
                      ColorManager.babyBlue,
                      AppStrings.body1.tr(),
                      baseFontSize),
                  Align(
                    alignment: Alignment.centerRight,
                    child: buildContainer(screenWidth, screenHeight * 0.08,
                        ColorManager.pink, AppStrings.body2.tr(), baseFontSize),
                  ),
                  buildContainer(
                      screenWidth,
                      screenHeight * 0.08,
                      ColorManager.babyBlue,
                      AppStrings.body3.tr(),
                      baseFontSize),
                  Align(
                    alignment: Alignment.centerRight,
                    child: buildContainer(screenWidth, screenHeight * 0.08,
                        ColorManager.pink, AppStrings.body4.tr(), baseFontSize),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppStrings.titleVision.tr(),
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: baseFontSize)),
            ),
            Container(
              height: screenWidth / 1.2,
              width: screenWidth,
              color: ColorManager.openPink,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Column(
                      children: [
                        buildContainer(
                            screenWidth,
                            screenHeight * 0.2,
                            ColorManager.babyBlue,
                            AppStrings.visionBody.tr(),
                            baseFontSize),
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
                                      child: Lottie.asset(JsonAssets.instagram))),
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
                  ),
                ],
              ),
            ),
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
                                ErrorState(
                                    StateRendererType.fullScreenErrorState,
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
                        fontSize: baseFontSize * 0.5,
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

  Container buildContainer(double screenWidth, double height, Color color,
      String text, double baseFontSize) {
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
              color: ColorManager.black, fontSize: baseFontSize * 0.7),
        ),
      )),
    );
  }
}
