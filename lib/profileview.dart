import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:skoolworkshop/main.dart';
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
                // "https://cdn.dribbble.com/users/113499/screenshots/12787572/media/3a8bf7d51271e03e8beaef830c5babf2.png?compress=1&resize=1600x1200&vertical=top"
                "https://www.personality-insights.com/wp-content/uploads/2017/12/default-profile-pic-e1513291410505.jpg",
            onClicked: () async {},
          ),
          const SizedBox(height: 12),
          //Naam en email worden meegegeven in buildName methode :)
          buildName(),
          const SizedBox(height: 6),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 4),
          buildInfo(),
          const SizedBox(height: 4),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget buildName(/*results*/) => Column(
        children: [
          Text(
            "Naam " "Achternaam",
            style: Theme.of(context).textTheme.headline2,
          ),
          Text("Emailadres", style: Theme.of(context).textTheme.bodyText1)
        ],
      );

  Widget buildInfo(/*results*/) => Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Docent informatie",
                style: Theme.of(context).textTheme.headline3),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                        "Geslacht: "
                        "Vrouw "
                        "Geboortedatum: "
                        "01-01-2000",
                        style: Theme.of(context).textTheme.bodyText1)),
                Expanded(
                    child: Text("Rijbewijs: " "Ja         " "Auto: " "Nee",
                        style: Theme.of(context).textTheme.bodyText1))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text("Telefoonnummer: " "06-12345678",
                        style: Theme.of(context).textTheme.bodyText1)),
                Expanded(
                    child: Text(
                        "Adres: "
                        "straat  "
                        "nr "
                        "postcode "
                        "woonplaats",
                        style: Theme.of(context).textTheme.bodyText1))
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      );
}
