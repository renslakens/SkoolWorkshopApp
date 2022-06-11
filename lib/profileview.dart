import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:skoolworkshop/profiles.dart';

import 'Widgets/profile_widget.dart';

class singleProfilePage extends StatefulWidget {
  const singleProfilePage({Key? key}) : super(key: key);

  @override
  State<singleProfilePage> createState() => _singleProfilePageState();
}

class _singleProfilePageState extends State<singleProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Profiel',
        style: Theme.of(context).textTheme.headline1,
      )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          ProfilePictureWidget(
            imagePath:
                "https://cdn.dribbble.com/users/113499/screenshots/12787572/media/3a8bf7d51271e03e8beaef830c5babf2.png?compress=1&resize=1600x1200&vertical=top",
            onClicked: () async {},
          ),
          const SizedBox(height: 12),
          //Naam en email worden meegegeven in buildName methode :)
          buildName(),
          const SizedBox(height: 8),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 8),
          buildInfo(),
        ],
      ),
    );
  }

  Widget buildName(/*results*/) => Column(
        children: [
          Text(
            "Naam",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 4,
          ),
          Text("Emailadres", style: Theme.of(context).textTheme.bodyText1)
        ],
      );

  buildInfo() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Docent informatie",
              style: Theme.of(context).textTheme.headline3),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("",
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
              Column(
                children: [
                  Text("", style: Theme.of(context).textTheme.bodyText1)
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
}
