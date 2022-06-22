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
  State<singleProfilePage> createState() =>
      _singleProfilePageState();
}

class _singleProfilePageState extends State<singleProfilePage> {
  final String getAcceptedUser = apis.baseUrl + apis.acceptedProfiles;
  DateFormat dateFormat = DateFormat("yyyy-dd-MM HH:mm:ss");
  DateFormat properDate = DateFormat("yyyy-dd-MM");

  List<UserModel>? userModel = [];

  Future<List<dynamic>> fetchUsers() async {
    var result =
        await http.get(Uri.parse(apis.baseUrl + apis.unAcceptedProfiles));
    print(result.body);
    final filteredUser = json.decode(result.body)['result'].where(
          (um) =>
              um.results.indexWhere(
                (r) => r.emailadres == widget.emailadres,
              ) >=
              0,
        );
    // print("user: " + filteredUser[0].results[0].toString());

    return filteredUser[0].results[0];
  }

  String _naam(dynamic user) {
    return user['voornaam'];
  }

  String _achternaam(dynamic user) {
    return user['wachtwoord'];
  }

  String _geboorteplaats(dynamic user) {
    return user['geboorteplaats'];
  }

  String _geboortedatum(dynamic user) {
    String geboortedatum = user['geboortedatum'] ?? 0;
    DateTime newtime = dateFormat.parse(geboortedatum.replaceAll("T", " "));
    return properDate.format(newtime);
  }

  String _emailadres(dynamic user) {
    return user['emailadres'];
  }

  String _geslacht(dynamic user) {
    return user['geslacht'];
  }

  String _rijbewijs(dynamic user) {
    return user['heeftRijbewijs'];
  }

  String _auto(dynamic user) {
    return user['heeftAuto'];
  }

  String _adres(dynamic user) {
    return user['adres'];
  }

  String _huisnummer(dynamic user) {
    return user['huisnummer'];
  }

  String _postcode(dynamic user) {
    return user['postcode'];
  }

  String _woonplaats(dynamic user) {
    return user['_woonplaats'];
  }

  String _telefoon(dynamic user) {
    return user['telefoon'];
  }

  String _land(dynamic user) {
    return user['land'];
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _getData();
  // }

  // void _getData() async {
  //   userModel = (await ApiService().getUnacceptedProfiles())!;
  //   final filteredUsers = userModel?.where((um) => um.result.indexWhere((r) => r.emailadres == emailadres,) >= 0,);
  // }

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
            // _achternaam(fetchUsers()).toString(),
            // "${fetchUsers()} ${_achternaam(fetchUsers)}",
            "d",
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
