import 'package:flutter/material.dart';
import 'package:skoolworkshop/Model/workShopDetailModel.dart';
import 'package:skoolworkshop/awaitingprofile.dart';
import 'package:skoolworkshop/profiles.dart';
import 'package:skoolworkshop/profileview.dart';
import 'package:skoolworkshop/register.dart';
import 'package:skoolworkshop/theme.dart';
import 'package:skoolworkshop/workshopDetail.dart';

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
      theme: customLightTheme(),
      initialRoute: '/login',
      routes: {
        '/workshop' : (BuildContext context) => WorkshopDetailPage(),
        '/notification' : (BuildContext context) => const NotificationPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const RegisterPage(),
        '/': (BuildContext context) => const HomePage(),
        '/awaiting': (BuildContext context) => const awaitingProfile(),
        '/profiles': (BuildContext context) => const ProfilePage(),
        '/profile' : (BuildContext context) => const singleProfilePage(),
      },
    );
  }
}