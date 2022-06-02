import 'dart:io';

import 'package:flutter/material.dart';

import 'colors.dart';

class awaitingProfile extends StatelessWidget {
  const awaitingProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => exit(0)),
        ),
        body: const Padding(
          padding: EdgeInsets.all(80.0),
          child: Center(
            child: Text(
              'Je profiel is nog niet beoordeeld, je krijgt een mailtje zodra dit is gebeurd.',
              style: TextStyle(
                  fontFamily: 'Heebo', fontSize: 25, color: HeeboColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
