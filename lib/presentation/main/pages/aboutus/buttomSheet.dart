import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

void bottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;
      TextScaler textScaler = MediaQuery.textScalerOf(context);

      return SizedBox(
        height: height - kToolbarHeight,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: ColorManager.black,
                    ),
                  ),
                ),
                titleText(AppStrings.privacyTitle.tr(), textScaler),
                bodyText(AppStrings.privacyBody.tr(), textScaler),
                titleText(AppStrings.informationTitle.tr(), textScaler),
                bodyText(AppStrings.informationBody.tr(), textScaler),
                titleText(AppStrings.logDataTitle.tr(), textScaler),
                bodyText(AppStrings.logDataBody.tr(), textScaler),
                titleText(AppStrings.serviceTitle.tr(), textScaler),
                bodyText(AppStrings.serviceBody.tr(), textScaler),
                titleText(AppStrings.securityTitle.tr(), textScaler),
                bodyText(AppStrings.securityBody.tr(), textScaler),
                titleText(AppStrings.changePrivacyTitle.tr(), textScaler),
                bodyText(AppStrings.changePrivacyBody.tr(), textScaler),
                titleText(AppStrings.contactUsTitle.tr(), textScaler),
                bodyText(AppStrings.contactUsBody.tr(), textScaler),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Padding bodyText(String text, TextScaler textScaler) {
  return Padding(
    padding: const EdgeInsets.all(AppValues.v8),
    child: Text(
      text,
      style: getRegularStyle(
        color: ColorManager.black,
        fontSize: textScaler.scale(AppValues.v15),
      ),
    ),
  );
}

Padding titleText(String text, TextScaler textScaler) {
  return Padding(
    padding: const EdgeInsets.all(AppValues.v8),
    child: Text(
      text,
      style: getBoldStyle(
        color: ColorManager.black,
        fontSize: textScaler.scale(AppValues.v20),
      ),
    ),
  );
}
