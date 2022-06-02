import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'api_test.dart';

class SkoolWorkshopApp extends StatelessWidget {
  const SkoolWorkshopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkoolWorkshop',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => MyApp(),
        '/': (BuildContext context) => const HomePage(),
      },
    );
  }
}

//Themas hieronder plaatsen
