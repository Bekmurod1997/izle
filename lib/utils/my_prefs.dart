import 'package:get_storage/get_storage.dart';
import 'package:izle/utils/shared_preferences.dart';

class MyPref {
  static final prefs = GetStorage();

  static String get token => prefs.read(SPKeys.token) ?? '';
  static String get userName => prefs.read(SPKeys.userName);
  static String get email => prefs.read(SPKeys.email);
  static String get code => prefs.read(SPKeys.code);
  static String get phoneNumber => prefs.read(SPKeys.phoneNumber);

  static set token(String value) => prefs.write(SPKeys.token, value);
  static set userName(String value) => prefs.write(SPKeys.userName, value);
  static set email(String value) => prefs.write(SPKeys.email, value);
  static set code(String value) => prefs.write(SPKeys.code, value);
  static set phoneNumber(String value) =>
      prefs.write(SPKeys.phoneNumber, value);

  static clearToken() => prefs.remove(SPKeys.token);
  static clearEmail() => prefs.remove(SPKeys.email);
  static clearCode() => prefs.remove(SPKeys.code);
  static clearUserName() => prefs.remove(SPKeys.userName);
  static clearPhoneNumber() => prefs.remove(SPKeys.phoneNumber);
}
