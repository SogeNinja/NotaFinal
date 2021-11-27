import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notafinal/services/key_shar.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensaje entrante'),
      ),
      body: Center(
        child: Text('Lo haz conseguido Branco', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
