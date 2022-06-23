import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:skoolworkshop/main.dart';
import 'package:skoolworkshop/profiles.dart';
import '/Model/userModel.dart';
import 'package:skoolworkshop/apis.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import 'package:get/get.dart';

import 'Widgets/profile_widget.dart';

class singleProfilePage extends StatefulWidget {
  singleProfilePage({Key? key, required this.emailadres}) : super(key: key);
  String emailadres;

  @override
  State<singleProfilePage> createState() => _singleProfilePageState();
}

class _singleProfilePageState extends State<singleProfilePage> {
  final String getAcceptedUser = apis.baseUrl + "/api/docent/test5@gmail.com";
  DateFormat dateFormat = DateFormat("yyyy-dd-MM HH:mm:ss");
  DateFormat properDate = DateFormat("yyyy-dd-MM");

  List<UserModel>? userModel = [];

  // Future<List<dynamic>> fetchUsers() async {
  //   var result = await http.get(Uri.parse(apis.baseUrl + "/api/docent/test5@gmail.com"));
  //   print(result.body);
  //   return json.decode(result.body)['result'];
  // }

  String _naam(dynamic workshop) {
    return workshop['naam'] ?? "Onbekende workshop";
  }

  String endResult = "d";

  String achternaam = "e";
  String textBetweenWords(
      String sentence, String firstWord, String secondWord) {
    if(sentence.length < 4){
      return "na";
    }else {
      print(sentence);
      print(firstWord);
      print(secondWord);
      return sentence.substring(sentence.indexOf(firstWord) + firstWord.length,
          sentence.indexOf(secondWord));
    }
  }

  Future<String> fetchUsers() async {
    var result =
        await http.get(Uri.parse(apis.baseUrl + "/api/docent/" + widget.emailadres));
    print("\n\n\n\n\n");
    endResult = result.body.toString();
    return result.body.toString();
  }

  String _achternaam(dynamic user) {
    // print(user);
    achternaam = "d+";
    fetchUsers().then((value) => endResult = value);
    return endResult;
    // return user['wachtwoord'] ?? "d";
  }

  @override
  Widget build(BuildContext context) {
    fetchUsers();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
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
          buildName(context),
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

  Widget buildName(BuildContext context) => Column(
        children: [
          Text(
            textBetweenWords(_achternaam(fetchUsers()), '"voornaam":"', '","achternaam"'),
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
                        "straat:   "
                        "nr:  "
                        "postcode:  "
                        "woonplaats: ",
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
