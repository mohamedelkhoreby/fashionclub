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
      return SizedBox(
        height:MediaQuery.sizeOf(context).height - (kToolbarHeight),
        child: SingleChildScrollView(
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
                      )),
                ),
                titleText(AppStrings.privacyTitle.tr()),
                bodyText(AppStrings.privacyBody.tr()),
                titleText(AppStrings.informationTitle.tr()),
                bodyText(AppStrings.informationBody.tr()),
                titleText(AppStrings.logDataTitle.tr()),
                bodyText(AppStrings.logDataBody.tr()),
                titleText(AppStrings.serviceTitle.tr()),
                bodyText(AppStrings.serviceBody.tr()),
                titleText(AppStrings.securityTitle.tr()),
                bodyText(AppStrings.securityBody.tr()),
                titleText(AppStrings.changePrivacyTitle.tr()),
                bodyText(AppStrings.changePrivacyBody.tr()),
                titleText(AppStrings.contactUsTitle.tr()),
                bodyText(AppStrings.contactUsBody.tr()),
              ]),
        ),
      );
    },
  );
}

Padding bodyText(String text) {
  return Padding(
    padding: const EdgeInsets.all(AppValues.v8),
    child: Text(
      text,
      style:
          getRegularStyle(color: ColorManager.black, fontSize: AppValues.v10),
    ),
  );
}

Padding titleText(String text) {
  return Padding(
    padding: const EdgeInsets.all(AppValues.v8),
    child: Text(
      text,
      style: getBoldStyle(color: ColorManager.black, fontSize: AppValues.v14),
    ),
  );
}
