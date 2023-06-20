import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:splashscreen/presentation/onBoarding/view/onBoarding_View.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';


class Boarding extends StatefulWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  BoardingState createState() => BoardingState();
}

class BoardingState extends State<Boarding> {
  String onboardImage = ImageAssets.boarding;
  @override
  void initState() {
    loadPictures();
    super.initState();
  }
  Future<void> loadPictures() async {
  await precachePicture(
  ExactAssetPicture(
  SvgPicture.svgStringDecoder
  ,onboardImage)
  ,null);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.black,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SizedBox(
                      width: 350.0,
                      height: 400.0,
                      child:SvgPicture.asset(onboardImage),
)),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 300.0,
        height: 40.0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnBoardingView()));
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorManager.white),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
          ),
          child: Text(AppStrings.bottomContinue,
              style: getSemiBoldStyle(
                color: ColorManager.black,
                fontSize: FontSize.s13,
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loadPictures();
    super.dispose();
  }
}
