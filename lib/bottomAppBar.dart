import 'package:flutter/material.dart';
import 'colors.dart';

class BottomAppBar extends StatefulWidget {
  const BottomAppBar({Key? key}) : super(key: key);

  @override
  State<BottomAppBar> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
        mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 40),
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
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
            label: 'In afwachting',
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
        onTap: _onItemTapped,
      ),
    );
  }
}
