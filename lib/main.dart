import 'package:flutter/material.dart';

import 'api/api.dart';
import 'mods/screen1.dart';
import 'app_legal/screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
      },
    );
  }
}
