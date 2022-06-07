import 'package:flutter/material.dart';
import 'package:skoolworkshop/notification.dart';

import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'notification.dart';
import 'awaitingProfile.dart';
import 'register.dart';

class SkoolWorkshopApp extends StatefulWidget {
  const SkoolWorkshopApp({Key? key}) : super(key: key);

  @override
  _SkoolWorkshopAppState createState() => _SkoolWorkshopAppState();
}

class _SkoolWorkshopAppState extends State<SkoolWorkshopApp> {
  int currentIndex = 0;

  final screens = [
    HomePage(),
    awaitingProfile(),
    awaitingProfile(),
    NotificationPage(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainColor,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Bevestigd',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Afwachting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications_outlined),
            label: 'Meldingen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profiel',
          ),
        ],
      ),
    );
  }
}