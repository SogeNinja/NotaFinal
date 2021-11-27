import 'package:flutter/material.dart';

import 'package:notafinal/screen/contador_screen.dart';
import 'package:notafinal/screen/message.dart';
import 'package:notafinal/services/key_shar.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'NotaFinal';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<NavigatorState> navagacionKey =
      new GlobalKey<NavigatorState>();

  final GlobalKey<ScaffoldMessengerState> messageKey =
      new GlobalKey<ScaffoldMessengerState>();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Bienvenido',
      style: optionStyle,
    ),
    ContadorPage(), //contador
    //MessageScreen() //message
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    PushNotificationService.streamMessageController.listen((message) {
      print('El mensaje de la app: $message');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MessageScreen()),
      );

      final snackBar = SnackBar(content: Text(message));
      messageKey.currentState?.showSnackBar(snackBar);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota Final'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.countertops),
            label: 'Contador',
          ),
          /*
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mensaje',
          ),*/
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
