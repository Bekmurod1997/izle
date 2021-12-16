import 'package:get_storage/get_storage.dart';
import 'package:izle/utils/shared_preferences.dart';

class MyPref {
  static final prefs = GetStorage();

  static String get token => prefs.read(SPKeys.token) ?? '';
  static String get fcmToken => prefs.read(SPKeys.fcmToken) ?? '';
  // static String get userToken => prefs.read(SPKeys.userToken) ?? '';
  static String get password => prefs.read(SPKeys.password) ?? '';
  static String get userName => prefs.read(SPKeys.userName) ?? '';
  static String get paymentLink => prefs.read(SPKeys.paymentLink) ?? '';
  static String get email => prefs.read(SPKeys.email);
  static String get code => prefs.read(SPKeys.code);
  static String get phoneNumber => prefs.read(SPKeys.phoneNumber) ?? '';
  static String get userId => prefs.read(SPKeys.userId);
  static String get loginLanding => prefs.read(SPKeys.loginLanding) ?? '';

  static set token(String value) => prefs.write(SPKeys.token, value);
  static set fcmToken(String value) => prefs.write(SPKeys.fcmToken, value);
  // static set userToken(String value) => prefs.write(SPKeys.userToken, value);
  static set password(String value) => prefs.write(SPKeys.password, value);
  static set userName(String value) => prefs.write(SPKeys.userName, value);
  static set paymentLink(String value) =>
      prefs.write(SPKeys.paymentLink, value);
  static set email(String value) => prefs.write(SPKeys.email, value);
  static set code(String value) => prefs.write(SPKeys.code, value);
  static set userId(String value) => prefs.write(SPKeys.code, value);
  static set loginLanding(String value) =>
      prefs.write(SPKeys.loginLanding, value);

  static set phoneNumber(String value) =>
      prefs.write(SPKeys.phoneNumber, value);

  static clearToken() => prefs.remove(SPKeys.token);
  static clearFcmToken() => prefs.remove(SPKeys.fcmToken);
  static clearEmail() => prefs.remove(SPKeys.email);
  static clearCode() => prefs.remove(SPKeys.code);
  static clearUserName() => prefs.remove(SPKeys.userName);
  static clearPaymentLink() => prefs.remove(SPKeys.paymentLink);
  static clearUserId() => prefs.remove(SPKeys.userId);
  static clearPhoneNumber() => prefs.remove(SPKeys.phoneNumber);
  static clearloginLanding() => prefs.remove(SPKeys.loginLanding);

  static clearAllll() {
    prefs.remove(SPKeys.token);
    // prefs.remove(SPKeys.userToken);
    prefs.remove(SPKeys.password);
    prefs.remove(SPKeys.email);
    prefs.remove(SPKeys.code);
    prefs.remove(SPKeys.userName);
    prefs.remove(SPKeys.phoneNumber);
    prefs.remove(SPKeys.userId);
    prefs.remove(SPKeys.loginLanding);
    prefs.remove(SPKeys.paymentLink);
    prefs.remove(SPKeys.fcmToken);
  }
}
