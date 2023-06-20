import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:splashscreen/presentation/Login/viewModel/login_view_model.dart';

import '../../../app/app_prefs.dart';
import '../../../app/dependency_injection.dart';
import '../../common/state_renderer/state_renderer_impl.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';

import '../../resources/routes_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? _passwordVisible;

  _bind() {
    _viewModel.start(); // tell view-model, start ur job
    _userNameController.addListener(() => _viewModel.setUserName(_userNameController.text));
    _userPasswordController.addListener(() => _viewModel.setPassword(_userPasswordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _appPreferences.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
        });
      }
    });
  }
  @override
  void initState() {
    _bind();
    _passwordVisible = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }
  Widget _getContentWidget() {
    return Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s28,),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outIsUserNameValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                              hintText: AppStrings.username.tr(),
                              labelText: AppStrings.username.tr(),
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.usernameError.tr()),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outIsPasswordValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _userPasswordController,
                            obscureText: _passwordVisible!,
                            decoration: InputDecoration(
                              hintText: AppStrings.password,
                              labelText: AppStrings.password,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.passwordError.tr(),
                              suffixIcon: IconButton(
                                iconSize: AppSize.s12,
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = _passwordVisible!;});},
                                icon: Icon(
                                  _passwordVisible! ? Icons.visibility
                                      : Icons.visibility_off,
                                color: ColorManager.white,
                        ),
                        ),
                            )
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                _viewModel.login();
                              } : null,
                              child: Text(AppStrings.login.tr()))
                        );
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: AppPadding.p1,
                        left: AppPadding.p28,
                        right: AppPadding.p28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                          },
                          child: Text(
                              AppStrings.forgetPassword.tr(),
                            style: getSemiBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s13,)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                          child: Text(
                              AppStrings.registerText.tr(),
                              style: getSemiBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s13,
                              )),
                        )
                      ],
                    )), Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p1,
                left: AppPadding.p28,
                right: AppPadding.p28),
            child:TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.mainRoute);
              },
              child: Text(
                  AppStrings.bottomSkip.tr(),
                  style: getSemiBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s13,
                  )),
            )
                ),
              ],
            ),
          ),
        ));
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
