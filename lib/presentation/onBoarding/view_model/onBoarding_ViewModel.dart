import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:splashscreen/domain/model/models.dart';

import '../../base/base_model_view.dart';
import '../../resources/strings_manager.dart';


class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
// stream controllers outputs
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  int skipBoarding() {
    int skipIndex = --_currentIndex;
    if (skipIndex != 0) {
     skipIndex = 2;

    }
    return skipIndex;
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // onBoarding viewModel output
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onBoarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

// onBoarding private functions
  List<SliderObject> _getSliderData() => [
        SliderObject(
            AppStrings.boardingTitle1.tr(), AppStrings.boardingBody1.tr()),
        SliderObject(
            AppStrings.boardingTitle2.tr(), AppStrings.boardingBody2.tr()),
        SliderObject(
            AppStrings.boardingTitle3.tr(), AppStrings.boardingBody3.tr()),
      ];
}

//inputs Mean that "orders" that our view model will receive from view
abstract class OnBoardingViewModelInput {
  void onPageChanged(int index);

  void goPrevious();

  void goNext();

  void skipBoarding(); // when user clicks on skip
// stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
