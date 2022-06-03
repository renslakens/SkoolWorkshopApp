import 'package:flutter/material.dart';
import 'package:skoolworkshop/notification.dart';
import 'package:skoolworkshop/register.dart';

import 'home.dart';
import 'api_test.dart';
import 'login.dart';
import 'register.dart';

class SkoolWorkshopApp extends StatelessWidget {
  const SkoolWorkshopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkoolWorkshop',
      initialRoute: '/login',  // set back to login after running
      routes: {
        '/api_test' : (BuildContext context) => MyApp(),
        '/notification' : (BuildContext context) => const notificationPage(),
        '/register': (BuildContext context) => const RegisterPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const HomePage(),
      },
    );
  }
}

//Themas hieronder plaatsen
