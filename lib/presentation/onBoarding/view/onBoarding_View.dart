
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:splashscreen/domain/model/models.dart';
import 'package:splashscreen/presentation/onBoarding/view_model/onBoarding_ViewModel.dart';

import '../../../app/app_prefs.dart';
import '../../../app/dependency_injection.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/constant_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}
class OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind() {
    _appPreferences.setOnBoardingScreenViewed();
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  Material _skipButton() {
    return Material(
      child: SizedBox(
          width: 300.0,
          height: 40.0,
          child: ElevatedButton(
            onPressed: () {
             _pageController.animateToPage(_viewModel.skipBoarding(), 
             curve: Curves.bounceInOut,
             duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime)
                      );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorManager.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
            ),
            child: Text(AppStrings.bottomSkip,
                style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s13,
                )),
          )),
    );
  }

  Material get _enterButton {
    return Material(
      child: SizedBox(
          width: 300.0,
          height: 40.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorManager.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
            ),
            child: Text(AppStrings.bottomENTER,
                style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s13,
                )),
          )),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }
  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
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
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return
              OnBoardingPage(sliderViewObject.sliderObject);
          }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:Padding(
          padding: const EdgeInsets.symmetric(horizontal:50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                // widgets indicator and arrows
                child: _getBottomSheetWidget(sliderViewObject)
              ), const SizedBox(
                height: 60,
              ),  sliderViewObject.currentIndex == sliderViewObject.numOfSlides - 1
                  ? _enterButton
                  : _skipButton()
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // left arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: const SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
            ),
            onTap: () {
              // go to previous slide
              _pageController.animateToPage(_viewModel.goPrevious(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut);

            },
          ),
        ),
        // circle indicator
        Row(
          children: [
            for (int i = 0 ; i < sliderViewObject.numOfSlides; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p0),
                child: _getProperCircle(i, sliderViewObject.currentIndex),
              )
          ],
        ),
        // right arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
              child: const SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut);
              }),
        )
      ],
    );
  }
  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.soldLine);
    } else {
      return SvgPicture.asset(ImageAssets.hollowLine);
    }
  }

}
class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: DefaultTextStyle(
            style: getRegularStyle3(
                color: ColorManager.white, fontSize: FontSize.s15),
            textAlign: TextAlign.left,
            child: Text(_sliderObject.title),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: DefaultTextStyle(
              style: getRegularStyle2(
                  color: ColorManager.white, fontSize: FontSize.s13),
              textAlign: TextAlign.left,
              child: Text(
                _sliderObject.body,
              ),
            ),
          )),
    ]
    ));
  }
}



