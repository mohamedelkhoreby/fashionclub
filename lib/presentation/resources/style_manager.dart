import 'package:flutter/material.dart';

import '../../presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getBlackStyle({double fontSize = FontSize.s50, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.black, color);
}

TextStyle getBoldStyle({double fontSize = FontSize.s25, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

TextStyle getSemiBoldStyle({double fontSize = FontSize.s25, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getSemiBoldStyle1(
    {double fontSize = FontSize.s19, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s25, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getRegularStyle1(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getRegularStyle2(
    {double fontSize = FontSize.s13, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getRegularStyle3(
    {double fontSize = FontSize.s15, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getRegularStyle4(
    {double fontSize = FontSize.s11, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getLightStyle({double fontSize = FontSize.s28, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
