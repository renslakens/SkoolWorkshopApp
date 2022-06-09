import 'dart:io';

import 'package:flutter/material.dart';

import 'colors.dart';

class workshopDetailpage extends StatelessWidget {
  const workshopDetailpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('workshop naam'),
            backgroundColor: mainColor,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                }),
          ),
          backgroundColor: backgroundColor,
          body: Column(children: <Widget>[
            Row(
              //ROW 1
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25.0, top: 25.0),
                  child: Text(
                    'Workshop Naam',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ),
              ],
            ),
            Row(//ROW 2
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                        margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Tijdens deze workshop wordt er gewerkt en aandacht gegeven aan de Big 5! Doorzettingsvermogen, Durven, Overwinnen, Respect en Zelfvertrouwen. Jij zorgt ervoor dat deze materialen worden meegenomen: \n\n -Kickbokshandschoenen \n -Stootkussens \n -Trapkussens \n -Pads \n *Geluidsbox mag eventueel ook mee',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ) //BoxDecor
                    ),
                  )

            ]),
            Row(// ROW 3
                children: [
              Container(
                color: Colors.orange,
                margin: EdgeInsets.all(25.0),
                child: FlutterLogo(
                  size: 190.0,
                ),
              ),
            ]),
          ])),
    );
  }
}
