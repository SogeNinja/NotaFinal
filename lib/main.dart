import 'package:flutter/material.dart';
import 'package:notafinal/screen/home_screen.dart';
import 'package:notafinal/screen/message.dart';
import 'package:notafinal/services/key_shar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}
