
import 'dart:ffi';

import 'package:rxdart/rxdart.dart';
import 'package:splashscreen/presentation/base/base_model_view.dart';

import '../../../../../domain/model/models.dart';
import '../../../../../domain/usecase/home_usecase.dart';
import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

class MenuViewModel extends BaseViewModel
    with  MenuViewModelInput,  MenuViewModelOutput {
  final _dataStreamController = BehaviorSubject< MenuViewObject>();

  final HomeUseCase _homeUseCase;

  MenuViewModel(this._homeUseCase);

  // --  inputs
  @override
  void start() {
    _getHomeData();
  }

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _homeUseCase.execute(Void)).fold(
            (failure) => {
          // left -> failure
          inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.message))
        },(homeObject) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputMenuData.add(MenuViewObject(
          homeObject.data.stores,

      ));
      // navigate to main screen
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputMenuData => _dataStreamController.sink;

  // -- outputs
  @override
  Stream< MenuViewObject> get outputMenuData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class MenuViewModelInput {
  Sink get inputMenuData;
}

abstract class  MenuViewModelOutput {
  Stream< MenuViewObject> get outputMenuData;
}

class  MenuViewObject {
  List<Store> stores;
  MenuViewObject(this.stores);
}