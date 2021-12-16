import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:izle/utils/my_prefs.dart';

class PushNotificationService {
  static String? token;

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    MyPref.fcmToken = token!;

    print('firebase toke: $token');

    FirebaseMessaging.onBackgroundMessage(_onBackgoundHandler);

    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenandler);
  }

  static Future _onBackgoundHandler(RemoteMessage message) async {
    print("${message.data['title']}");
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print("${message.messageId}");
  }

  static Future _onMessageOpenandler(RemoteMessage message) async {
    print("${message.messageId}");
  }
}
