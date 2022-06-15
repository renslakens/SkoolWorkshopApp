import 'package:flutter/material.dart';
import 'package:skoolworkshop/notification.dart';
import 'package:skoolworkshop/profiles.dart';
import 'package:skoolworkshop/profileview.dart';

import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'notification.dart';
import 'awaitingProfile.dart';
import 'register.dart';

class SkoolWorkshopApp extends StatefulWidget {
  const SkoolWorkshopApp({Key? key, required this.rol}) : super(key: key);
  final String rol;

  @override
  _SkoolWorkshopAppState createState() => _SkoolWorkshopAppState();
}

class _SkoolWorkshopAppState extends State<SkoolWorkshopApp> {
  int currentIndex = 0;

  final TeacherScreens = [
    HomePage(),
    awaitingProfile(),
    awaitingProfile(),
    NotificationPage(),
    singleProfilePage(),
  ];

  final EmployeeScreens = [
    HomePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  final TeacherButtons = [
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
  ];

  final EmployeeButtons = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.circle_notifications_outlined),
      label: 'Meldingen',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Profielen',
    ),
  ];

  showScreens() {
    if(widget.rol == "Docent") {
      TeacherScreens[currentIndex];
    } else if(widget.rol == "Medewerker") {
      EmployeeScreens[currentIndex];
    } else {
      Center(child: Text("Error showing screens"));
    }
  }

  showButtons() {
    if(widget.rol == "Docent") {
      TeacherButtons;
    } else if(widget.rol == "Medewerker") {
      EmployeeButtons;
    } else {
      EmployeeButtons;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      //body: Center(child: Text(widget.rol)),
      //body: EmployeeScreens[currentIndex],
      body: showScreens(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainColor,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: showButtons(),
      ),
    );
  }
}