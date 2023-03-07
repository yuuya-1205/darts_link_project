import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static Future<void> requestPermission() => _fcm.requestPermission(
        announcement: true,
        carPlay: true,
        criticalAlert: true,
      );

  static Future<String?> getToken() => _fcm.getToken();
}
