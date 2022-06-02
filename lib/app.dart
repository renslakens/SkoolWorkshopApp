import 'package:flutter/material.dart';
import 'package:skoolworkshop/notification.dart';

import 'home.dart';
import 'api_test.dart';
import 'login.dart';

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
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const HomePage(),
      },
    );
  }
}

//Themas hieronder plaatsen
