import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:splashscreen/presentation/resources/color_manager.dart';
import 'package:splashscreen/presentation/resources/strings_manager.dart';
import 'package:splashscreen/presentation/resources/values_manager.dart';

import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_impl.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/launch_manager.dart';
import '../../../resources/style_manager.dart';
import 'buttomSheet.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double sizedBoxWidth = screenWidth / 3.5;
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: const EdgeInsets.only(left: AppPadding.p8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(AppStrings.titleConcept.tr(),
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: AppSize.s20)))),
        Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p12, right: AppPadding.p12),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              AppStrings.description_1.tr(),
              style: getRegularStyle4(
                  color: ColorManager.black, fontSize: AppSize.s10),
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
                    top: AppPadding.p10,
                    left: AppPadding.p5,
                    child: buildContainer(screenWidth, AppSize.s60,
                        ColorManager.babyBlue, AppStrings.body1.tr()),
                  ),
                  Positioned(
                    top: AppPadding.p80,
                    left: AppPadding.p50,
                    child: buildContainer(screenWidth, AppSize.s60,
                        ColorManager.pink, AppStrings.body2.tr()),
                  ),
                  Positioned(
                    top: AppPadding.p150,
                    left: AppPadding.p5,
                    child: buildContainer(screenWidth, AppSize.s60,
                        ColorManager.babyBlue, AppStrings.body3.tr()),
                  ),
                  Positioned(
                    top: AppPadding.p220,
                    left: AppPadding.p50,
                    child: buildContainer(screenWidth, AppSize.s70,
                        ColorManager.pink, AppStrings.body4.tr()),
                  ),
                ])),
        Padding(
            padding: const EdgeInsets.only(left: AppPadding.p8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(AppStrings.titleVision.tr(),
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: AppSize.s20)))),
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
                    top: AppPadding.p15,
                    left: AppPadding.p15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildContainerImage(
                            sizedBoxWidth, screenWidth, ImageAssets.aboutUs1),
                        const SizedBox(width: AppPadding.p8),
                        buildContainerImage(
                            sizedBoxWidth, screenWidth, ImageAssets.aboutUs2),
                        const SizedBox(width: AppPadding.p8),
                        buildContainerImage(
                            sizedBoxWidth, screenWidth, ImageAssets.aboutUs3),
                      ],
                    ),
                  ),
                  Positioned(
                    top: AppPadding.p130,
                    left: AppPadding.p30,
                    child: Column(
                      children: [
                        buildContainer(screenWidth, AppSize.s150,
                            ColorManager.babyBlue, AppStrings.visionBody.tr()),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  height: AppSize.s50,
                                  width: AppSize.s50,
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
                                  height: AppSize.s35,
                                  width: AppSize.s35,
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
        const SizedBox(height: AppSize.s35),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Align(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: AppSize.s35,
                      width: AppSize.s130,
                      child: buildElevatedButton(AppStrings.faq,(){}),
                    ),
                    SizedBox(
                      height: AppSize.s35,
                      width: AppSize.s130,
                      child: buildElevatedButton(AppStrings.contactUs,
                            () async {
                          var urllaunchable = await canLaunchUrl(AppLaunchUrl
                              .emailLaunchUri); //canLaunch is from url_launcher package
                          if (urllaunchable) {
                            await launchUrl(AppLaunchUrl
                                .contactEmailUri); //launch is from url_launcher package to launch URL
                          } else {
                            ErrorState(StateRendererType.fullScreenErrorState,
                                AppStrings.defaultError);
                          }},
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
        const SizedBox(height: AppSize.s50),
      ]),
    );
  }

  ElevatedButton buildElevatedButton(String text,function) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(ColorManager.black),
        shape: MaterialStateProperty.all(
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
      height: screenWidth / AppPadding.p3,
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
      width: (screenWidth / AppPadding.p2) + AppSize.s100,
      decoration: BoxDecoration(
        border: Border.all(color: color, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(AppPadding.p2),
        color: color,
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: AppPadding.p3),
        child: Text(
          text,
          style:
              getRegularStyle(color: ColorManager.black, fontSize: AppSize.s9),
        ),
      )),
    );
  }
}
