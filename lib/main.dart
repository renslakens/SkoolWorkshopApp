import 'package:flutter/material.dart';
import 'package:skoolworkshop/Model/workShopDetailModel.dart';
import 'package:skoolworkshop/awaitingprofile.dart';
import 'package:skoolworkshop/profiles.dart';
import 'package:skoolworkshop/profileview.dart';
import 'package:skoolworkshop/register.dart';
import 'package:skoolworkshop/theme.dart';
import 'package:skoolworkshop/workshopDetail.dart';

import 'addLocation.dart';
import 'app.dart';
import 'home.dart';
import 'login.dart';
import 'notification.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkoolWorkshop',
      theme: customLightTheme(),
      initialRoute: '/addlocation',
      routes: {
        '/workshop' : (BuildContext context) => WorkshopDetailPage(),
        '/notification' : (BuildContext context) => const NotificationPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const RegisterPage(rol: "",),
        '/': (BuildContext context) => const SkoolWorkshopApp(rol: "", token: "",),
        '/awaiting': (BuildContext context) => const awaitingProfile(),
        '/profiles': (BuildContext context) => const ProfilePage(),
        '/profile' : (BuildContext context) => const singleProfilePage(token: "",),
        '/addlocation' : (BuildContext context) => const AddLocationPage(),
      },
    );
  }
}