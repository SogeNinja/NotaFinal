import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static StreamController<String> _streamMessageController =
      new StreamController.broadcast();

  static Stream<String> get streamMessageController =>
      _streamMessageController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('Mensaje en 2do plano ${message.messageId}');

    print(message.data);
    _streamMessageController.sink
        .add(message.notification?.title ?? 'No viene el titulo');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('Mensaje en 2do plano ${message.messageId}');

    print(message.data);
    _streamMessageController.sink
        .add(message.notification?.title ?? 'No viene el titulo');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('_onMessageOpenApp ${message.messageId}');

    print(message.data);
    _streamMessageController.sink
        .add(message.data['message'] ?? 'Nada adicional');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreams() {
    _streamMessageController.close();
  }
}
