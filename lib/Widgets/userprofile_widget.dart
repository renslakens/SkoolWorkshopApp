import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/Widgets/profile_widget.dart';
import 'package:skoolworkshop/apis.dart';
import 'package:http/http.dart' as http;

import '../profileedit.dart';

class UserWidget extends StatelessWidget {
  UserWidget({Key? key}) : super(key: key);
  final String apiUrl = apis.baseUrl + apis.teacherProfile + "ast@gmail.com";

  Future<List<dynamic>> fetchUser() async {
    var result = await http.get(Uri.parse(apiUrl));
    print(result.body);
    return json.decode(result.body)['result'];
  }

  String _naam(dynamic teacher) {
    return teacher['naam'] ?? "Onbekende naam";
  }

  String _achternaam(dynamic teacher) {
    return teacher['achternaam'] ?? "Onbekende achternaam";
  }

  String _emailadres(dynamic teacher) {
    return teacher['emailadres'] ?? "Onbekend emailadres";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: fetchUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(20),
                        children: [
                          ProfilePictureWidget(
                            imagePath:
                                "https://cdn.dribbble.com/users/113499/screenshots/12787572/media/3a8bf7d51271e03e8beaef830c5babf2.png?compress=1&resize=1600x1200&vertical=top",
                            //"https://www.personality-insights.com/wp-content/uploads/2017/12/default-profile-pic-e1513291410505.jpg",
                            onClicked: () async {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) =>
                                      ProfileEditPage(
                                          emailadres: widget.emailadres)));
                            },
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
                          const SizedBox(height: 2),
                          buildInfo(),
                          const SizedBox(height: 2),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ],
                      );
                    })
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildName(
    String emailadres,
  ) =>
      Column(
        children: [
          Text(
            _naam(snapshot.data[index]).toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(emailadres, style: Theme.of(context).textTheme.bodyText1)
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
                        "Vrouw\n"
                        "Geboortedatum:\n"
                        "01-01-2000",
                        style: Theme.of(context).textTheme.bodyText1)),
                Expanded(
                    child: Text("Rijbewijs: " "Ja\n" "Auto: " "Nee",
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
                    child: Text("Telefoonnummer:\n" "06-12345678",
                        style: Theme.of(context).textTheme.bodyText1)),
                Expanded(
                    child: Text(
                        "Adres: "
                        "straat\n"
                        "nr "
                        "postcode "
                        "woonplaats",
                        style: Theme.of(context).textTheme.bodyText1))
              ],
            ),
          ],
        ),
      );
}
