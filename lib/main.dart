import 'package:flutter/material.dart';

import 'app.dart';
import 'home.dart';
import 'login.dart';
import 'notification.dart';

void main() => runApp(const SkoolWorkshopApp());

class SkoolWorkshopApp extends StatelessWidget {
  const SkoolWorkshopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkoolWorkshop',
      initialRoute: '/login',
      routes: {
        '/notification' : (BuildContext context) => const NotificationPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const HomePage(),
      },
    );
  }
}