import 'package:flutter/material.dart';
import 'package:splashscreen/presentation/resources/font_manager.dart';
import 'package:splashscreen/presentation/resources/style_manager.dart';
import 'package:splashscreen/presentation//resources/values_manager.dart';

import '../resources/color_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.white,
    primaryColorLight: ColorManager.openPink,
    primaryColorDark: ColorManager.pink,
    disabledColor: ColorManager.grey1,

    // card-view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s1_5,
    ),

    //appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.black,
      elevation: AppSize.s4,
      titleTextStyle: getBoldStyle(fontSize: FontSize.s28, color: Colors.black),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey,
        buttonColor: ColorManager.white,
        splashColor: ColorManager.lightGrey),

    //elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s13,),
            foregroundColor:ColorManager.black ,
            backgroundColor: ColorManager.white,
            disabledBackgroundColor:ColorManager.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s0)))),
    //text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headlineLarge: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s25),
      //Home , likes , About
      headlineMedium:getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
      headlineSmall:getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s15),
      titleLarge:getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
      // concept ,vision
      titleMedium:getLightStyle(color: ColorManager.white, fontSize: FontSize.s13),
      titleSmall:getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s13),
      //connect by whatsapp //size 20
      bodyLarge:getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s15),
      //size 15
      bodyMedium:getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s13),
      // size 11
      bodySmall: getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s10),
      labelSmall: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s12)
      //egy size 10
    ),
  // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        //style
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: ColorManager.white, fontSize: FontSize.s14),
        errorStyle:
            getRegularStyle(color: ColorManager.error, fontSize: FontSize.s10),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.white, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.white, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
