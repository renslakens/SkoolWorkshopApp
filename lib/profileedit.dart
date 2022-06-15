import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/main.dart';

import 'Widgets/profile_widget.dart';
import 'Widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String? gender;
  String? rijbewijs;
  String? auto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profiel bewerken",
            style: Theme.of(context).textTheme.headline1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profile');
            }),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        children: [
          ProfilePictureWidget(
            imagePath:
                "https://cdn.dribbble.com/users/113499/screenshots/12787572/media/3a8bf7d51271e03e8beaef830c5babf2.png?compress=1&resize=1600x1200&vertical=top",
            //"https://www.personality-insights.com/wp-content/uploads/2017/12/default-profile-pic-e1513291410505.jpg",
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 6,
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 6,
          ),
          buildEditInfo(),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget buildEditInfo() => Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFieldWidget(
                      label: 'Voornaam',
                      text: "Ayrianna",
                      onChanged: (voornaam) {}),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: TextFieldWidget(
                      label: 'Achternaam',
                      text: "Chatlein",
                      onChanged: (achternaam) {}),
                ),
                const SizedBox(width: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFieldWidget(
                      label: 'Telefoonnummer',
                      text: "06-12345678",
                      onChanged: (telefoonnummer) {}),
                ),
                const SizedBox(width: 28),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Geslacht",
                          style: Theme.of(context).textTheme.headline4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: 1,
                              groupValue: gender,
                              onChanged: (geslacht) {}),
                          Text(
                            'Vrouw',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: "Man",
                              groupValue: gender,
                              onChanged: (geslacht) {}),
                          Text('Man',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFieldWidget(
                      label: 'Straat',
                      text: "Straatje",
                      onChanged: (straat) {}),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: TextFieldWidget(
                      label: 'Huisnummer',
                      text: "11",
                      onChanged: (huisnummer) {}),
                ),
                const SizedBox(width: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFieldWidget(
                      label: 'Postcode',
                      text: "3492EK",
                      onChanged: (postcode) {}),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: TextFieldWidget(
                      label: 'Woonplaats',
                      text: "Breda",
                      onChanged: (woonplaats) {}),
                ),
                const SizedBox(width: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: TextFieldWidget(
                        label: 'Land',
                        text: "Nederland",
                        onChanged: (land) {})),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("In bezit van rijbewijs?",
                          style: Theme.of(context).textTheme.headline4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: 1,
                              groupValue: rijbewijs,
                              onChanged: (rijbewijs) {}),
                          Text(
                            'Ja',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: 0,
                              groupValue: rijbewijs,
                              onChanged: (rijbewijs) {}),
                          Text('Nee',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("In bezit van een auto?",
                          style: Theme.of(context).textTheme.headline4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: 1,
                              groupValue: auto,
                              onChanged: (auto) {}),
                          Text(
                            'Ja',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: 0,
                              groupValue: auto,
                              onChanged: (auto) {}),
                          Text('Nee',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      );
}
