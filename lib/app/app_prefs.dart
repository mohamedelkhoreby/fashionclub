import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyOnBoardingScreenViewed =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsKeyToken = "PREFS_KEY_TOKEN";
class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.english.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.arabic.getValue()) {
      // set english
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.english.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.arabic.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }

  // on boarding
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnBoardingScreenViewed, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefsKeyOnBoardingScreenViewed) ??
        false;
  }

  // token
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(prefsKeyLang, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(prefsKeyLang) ?? "";
  }

  //login
  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }
}