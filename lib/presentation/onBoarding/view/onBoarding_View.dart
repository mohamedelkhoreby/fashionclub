import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/app_prefs.dart';
import '../../../app/dependency_injection.dart';
import '../../../domain/model/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/constant_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
import '../view_model/onboarding_viewmodel.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

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

  Widget _skipButton() {
    return Material(
      child: SizedBox(
        width: 300.w,
        height: 40.h,
        child: ElevatedButton(
          onPressed: () {
            _pageController.animateToPage(_viewModel.skipBoarding(),
                curve: Curves.easeInOut,
                duration: const Duration(
                    milliseconds: AppConstants.sliderAnimationTime));
          },
          child: Text(
            AppStrings.bottomSkip,
            style: getSemiBoldStyle(
              color: ColorManager.black,
              fontSize: FontSize.s13.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget get _enterButton {
    return Material(
      child: SizedBox(
        width: 300.w,
        height: 40.h,
        child: ElevatedButton(
          onPressed: () {
            replacement(Routes.mainRoute);
          },
          child: Text(
            AppStrings.bottomEnter,
            style: getSemiBoldStyle(
              color: ColorManager.black,
              fontSize: FontSize.s13.sp,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
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
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: _getBottomSheetWidget(sliderViewObject),
              ),
              SizedBox(
                height: 60.h,
              ),
              sliderViewObject.currentIndex == sliderViewObject.numOfSlides - 1
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
        Padding(
          padding: EdgeInsets.all(AppValues.v14.h),
          child: GestureDetector(
            child: SizedBox(
              width: AppValues.v20.w,
              height: AppValues.v20.h,
            ),
            onTap: () {
              _pageController.animateToPage(_viewModel.goPrevious(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.easeInOut);
            },
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < sliderViewObject.numOfSlides; i++)
              Padding(
                padding: EdgeInsets.all(AppValues.v0.h),
                child: _getProperCircle(i, sliderViewObject.currentIndex),
              )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(AppValues.v14.h),
          child: GestureDetector(
            child: SizedBox(
              width: AppValues.v20.w,
              height: AppValues.v20.h,
            ),
            onTap: () {
              _pageController.animateToPage(_viewModel.goNext(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.easeInOut);
            },
          ),
        ),
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

  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DefaultTextStyle(
                style: getRegularStyle3(
                    color: ColorManager.white, fontSize: FontSize.s15.sp),
                textAlign: TextAlign.left,
                child: Text(_sliderObject.title),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DefaultTextStyle(
                style: getRegularStyle2(
                    color: ColorManager.white, fontSize: FontSize.s13.sp),
                textAlign: TextAlign.left,
                child: Text(
                  _sliderObject.body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
