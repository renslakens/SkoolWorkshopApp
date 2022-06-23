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
  const SkoolWorkshopApp({Key? key, required this.rol, required this.emailadres, required this.voornaam}) : super(key: key);
  final String rol;
  final String emailadres;
  final String voornaam;

  @override
  _SkoolWorkshopAppState createState() => _SkoolWorkshopAppState();
}

class _SkoolWorkshopAppState extends State<SkoolWorkshopApp> {
  int currentIndex = 0;

  late final TeacherScreens = [
    HomePage(rol: widget.rol, emailadres: widget.emailadres, voornaam: widget.voornaam,),
    awaitingProfile(),
    awaitingProfile(),
    singleProfilePage(emailadres: widget.emailadres,),
  ];

  late final EmployeeScreens = [
    HomePage(rol: widget.rol, emailadres: widget.emailadres, voornaam: widget.voornaam,),
    NotificationPage(emailadres: '',),
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
    if(widget.rol.toString() == "Docent") {
      return TeacherScreens[currentIndex];
    } else if(widget.rol.toString() == "Medewerker") {
      return EmployeeScreens[currentIndex];
    } else {
      return Center(child: Text("Error showing screens"));
    }
  }

  showButtons() {
    if(widget.rol.toString() == "Docent") {
      return TeacherButtons;
    } else if(widget.rol.toString() == "Medewerker") {
      return EmployeeButtons;
    } else {
      return TeacherButtons;
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
        backgroundColor: Colors.white,
        selectedItemColor: mainColor,
        currentIndex: currentIndex,
        elevation: 10000.0,
        onTap: (index) => setState(() => currentIndex = index),
        items: showButtons(),
      ),
    );
  }
}