import 'package:shared_preferences/shared_preferences.dart';

class LocalPreference {

  static String canUseBiometrics = "canUseBiometrics";
  static SharedPreferences? _prefs;

  static Future<SharedPreferences?> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  //save selected language
  static Future setCanUseBiometrics(value) async {
    await _prefs?.setBool(canUseBiometrics, value);
  }

  //get selected language
  static bool? getCanUseBiometrics() {
    return _prefs?.getBool(canUseBiometrics);
  }

  //clear and remove preferences
  static Future<bool?> remove(String key) async => await _prefs?.remove(key);
  static Future<bool?> clear() async => await _prefs?.clear();

}