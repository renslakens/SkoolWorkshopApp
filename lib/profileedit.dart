import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/apis.dart';
import 'colors.dart';
import 'package:http/http.dart' as http;
import 'package:skoolworkshop/colors.dart';
import 'package:intl/intl.dart';

class EditProfileWidget extends StatelessWidget {

  EditProfileWidget({Key? key,  required this.emailadres}) : super(key: key);

  String emailadres;

  DateFormat dateFormat = DateFormat("yyyy-dd-MM HH:mm:ss");
  DateFormat properDate = DateFormat("yyyy-dd-MM");
  DateFormat timeOnly = DateFormat("HH:mm");
  final String apiUrl = apis.baseUrl + apis.getWorkshopDetail;

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    print(result.body);
    return json.decode(result.body)['result'];
  }

  String _naam(dynamic workshop) {
    return workshop['naam'] ?? "Onbekende workshop";
  }

  String _beschrijving(dynamic workshop) {
    return workshop['beschrijving'] ?? "Geen beschrijving meegegeven";
  }

  int _aantalDocenten(dynamic job) {
    return job['aantalDocenten'] ?? 0;
  }

  int _salarisIndicatie(dynamic job) {
    return job['salarisIndicatie'] ?? 0;
  }

  String _datum(dynamic job) {
    String time = job['startTijd'] ?? 0;
    DateTime newtime = dateFormat.parse(time.replaceAll("T", " "));
    return properDate.format(newtime);
  }

  String _startTijd(dynamic job) {
    // print(job['startTijd'].toString());
    String time = job['startTijd'] ?? 0;
    DateTime newtime = dateFormat.parse(time.replaceAll("T", " "));
    return timeOnly.format(newtime);
  }

  String _eindTijd(dynamic job) {
    String time = job['eindTijd'] ?? 0;
    DateTime newtime = dateFormat.parse(time.replaceAll("T", " "));
    return timeOnly.format(newtime);
  }

  // DateTime _naamLocatie(dynamic location){
  //   // print(job['startTijd'].toString());
  //   return location[''] ?? 0;
  // }

  String _land(dynamic location) {
    return location['land'] ?? "Niet opgegeven";
  }

  String _postcode(dynamic location) {
    return location['postcode'] ?? "Niet opgegeven";
  }

  String _straat(dynamic location) {
    return location['straat'] ?? "Niet opgegeven";
  }

  String _huisnummer(dynamic location) {
    return location['huisnummer'] ?? "Niet opgegeven";
  }

  String _plaats(dynamic location) {
    return location['plaats'] ?? "Niet opgegeven";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Stack(children: <Widget>[
            PageView.builder(

              // padding: const EdgeInsets.all(8),
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Row(
                        //ROW 1
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 25.0, top: 25.0),
                                child: Text(
                                    _naam(snapshot.data[index]).toString(),
                                    style:
                                    Theme.of(context).textTheme.bodyText1))
                          ]),
                      Row(//ROW 2
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _beschrijving(snapshot.data[index])
                                          .toString(),
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ) //BoxDecor
                              ),
                            )
                          ]),
                      Row(//ROW 3
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      children: [
                                        Icon(Icons.schedule),
                                        Text(
                                          _datum(snapshot.data[index]).toString() +
                                              "\n" +
                                              _startTijd(snapshot.data[index])
                                                  .toString() +
                                              " - " +
                                              _eindTijd(snapshot.data[index])
                                                  .toString(),
                                          style:
                                          Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                  ) //BoxDecor
                              ),
                            )
                          ]),
                      Row(//ROW 4
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                  margin: EdgeInsets.only(left: 25.0, right: 25.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Wrap(
                                        crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                        children: [
                                          Icon(Icons.location_on),
                                          Text(
                                            _plaats(snapshot.data[index])
                                                .toString() +
                                                ", ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            _straat(snapshot.data[index])
                                                .toString() +
                                                " ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            _huisnummer(snapshot.data[index])
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          )
                                        ],
                                      )) //BoxDecor
                              ),
                            )
                          ]),
                      Row(//ROW 3
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                  margin: EdgeInsets.only(left: 25.0, right: 25.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Wrap(
                                        crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                        children: [
                                          Icon(Icons.euro),
                                          Text(
                                            _salarisIndicatie(snapshot.data[index])
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      )) //BoxDecor
                              ),
                            )
                          ]),
                    ],
                  );
                }),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const RegisterPage()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 50),
                      elevation: 8.0,
                      primary: mainColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      ),
                    ),
                    child: Text('Inschrijven',
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ))
          ]);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key, required this.emailadres}) : super(key: key);
  final String emailadres;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Workshop'),
        automaticallyImplyLeading: false,
      ),
      body: EditProfileWidget(emailadres: emailadres,),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
// import 'package:multi_select_flutter/util/multi_select_item.dart';
// import 'package:skoolworkshop/colors.dart';
//
// import 'Widgets/profile_widget.dart';
// import 'Widgets/textfield_widget.dart';
//
// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({Key? key}) : super(key: key);
//
//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }
//
// class Workshop {
//   final int id;
//   final String name;
//
//   Workshop({
//     required this.id,
//     required this.name,
//   });
// }
//
// class Target {
//   final int id;
//   final String target;
//
//   Target({
//     required this.id,
//     required this.target,
//   });
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   String? gender;
//   String? rijbewijs;
//   String? auto;
//
//   static final List<Workshop> _workshops = [
//     Workshop(id: 1, name: "Bootcamp"),
//     Workshop(id: 2, name: "Caribbean Drums"),
//     Workshop(id: 3, name: "Flashmob"),
//     Workshop(id: 4, name: "Ghetto Drums"),
//     Workshop(id: 5, name: "HipHop"),
//     Workshop(id: 6, name: "Light Graffiti"),
//     Workshop(id: 7, name: "Moderene Dans"),
//     Workshop(id: 8, name: "Pannavoetbal"),
//     Workshop(id: 9, name: "Photoshop"),
//     Workshop(id: 10, name: "Rap"),
//     Workshop(id: 11, name: "Smartphone Fotografie"),
//     Workshop(id: 12, name: "Soap Acteren"),
//     Workshop(id: 13, name: "Stage Fighting"),
//     Workshop(id: 14, name: "Streetdance"),
//     Workshop(id: 15, name: "Theatersport"),
//     Workshop(id: 16, name: "T-shirt Ontwewrpen"),
//     Workshop(id: 17, name: "Videoclip Maken"),
//     Workshop(id: 18, name: "Zelfverdediging"),
//     Workshop(id: 19, name: "Breakdance"),
//     Workshop(id: 20, name: "Dance-Fit"),
//     Workshop(id: 21, name: "Freerunning"),
//     Workshop(id: 22, name: "Graffiti"),
//     Workshop(id: 23, name: "Kickboksen"),
//     Workshop(id: 24, name: "Live Looping"),
//     Workshop(id: 25, name: "Percussie"),
//     Workshop(id: 26, name: "Popstar"),
//     Workshop(id: 27, name: "Stepping"),
//     Workshop(id: 28, name: "Stop Motion"),
//     Workshop(id: 29, name: "Vloggen"),
//   ];
//
//   final _workshopitems = _workshops
//       .map((workshop) => MultiSelectItem<Workshop>(workshop, workshop.name))
//       .toList();
//
//   static final List<Target> _targets = [
//     Target(id: 1, target: "BSO"),
//     Target(id: 2, target: "Primaire Onderwijs"),
//     Target(id: 3, target: "Voortgezet Onderwijs"),
//     Target(id: 4, target: "MBO en HBO"),
//     Target(id: 5, target: "Kinderfeestjes"),
//     Target(id: 6, target: "Vrijgezellenfeesten"),
//     Target(id: 7, target: "Bedrijfsuitjes/Teambuilding"),
//     Target(id: 8, target: "Speciaal Onderwijs"),
//   ];
//
//   final _targetitems = _targets
//       .map((target) => MultiSelectItem<Target>(target, target.target))
//       .toList();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profiel bewerken",
//             style: Theme.of(context).textTheme.headline1),
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/profile');
//             }),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(20),
//         physics: BouncingScrollPhysics(),
//         children: [
//           ProfilePictureWidget(
//             imagePath:
//                 "https://cdn.dribbble.com/users/113499/screenshots/12787572/media/3a8bf7d51271e03e8beaef830c5babf2.png?compress=1&resize=1600x1200&vertical=top",
//             //"https://www.personality-insights.com/wp-content/uploads/2017/12/default-profile-pic-e1513291410505.jpg",
//             isEdit: true,
//             onClicked: () async {},
//           ),
//           const SizedBox(
//             height: 6,
//           ),
//           const Divider(
//             height: 20,
//             thickness: 1,
//             color: Colors.black,
//           ),
//           const SizedBox(
//             height: 6,
//           ),
//           buildEditInfo(),
//           const Divider(
//             height: 20,
//             thickness: 1,
//             color: Colors.black,
//           ),
//           const SizedBox(height: 6),
//           buildWorkshopSelect(),
//           const SizedBox(height: 6),
//           buildTargetSelect(),
//         ],
//       ),
//     );
//   }
//
//   Widget buildEditInfo() => Container(
//         padding: EdgeInsets.all(5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: TextFieldWidget(
//                       label: 'Voornaam',
//                       text: "Ayrianna",
//                       onChanged: (voornaam) {}),
//                 ),
//                 const SizedBox(width: 30),
//                 Expanded(
//                   child: TextFieldWidget(
//                       label: 'Achternaam',
//                       text: "Chatlein",
//                       onChanged: (achternaam) {}),
//                 ),
//                 const SizedBox(width: 20),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: TextFieldWidget(
//                       label: 'Telefoonnummer',
//                       text: "06-12345678",
//                       onChanged: (telefoonnummer) {}),
//                 ),
//                 const SizedBox(width: 28),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Geslacht",
//                           style: Theme.of(context).textTheme.headline4),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Radio(
//                             activeColor: mainColor,
//                             value: "Vrouw",
//                             groupValue: gender,
//                             onChanged: (value) {
//                               setState(() {
//                                 gender = value.toString();
//                               });
//                             },
//                           ),
//                           Text(
//                             'Vrouw',
//                             style: Theme.of(context).textTheme.bodyText1,
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Radio(
//                             activeColor: mainColor,
//                             value: "Man",
//                             groupValue: gender,
//                             onChanged: (value) {
//                               setState(() {
//                                 gender = value.toString();
//                               });
//                             },
//                           ),
//                           Text('Man',
//                               style: Theme.of(context).textTheme.bodyText1),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: TextFieldWidget(
//                       label: 'Straat',
//                       text: "Straatje",
//                       onChanged: (straat) {}),
//                 ),
//                 const SizedBox(width: 30),
//                 Expanded(
//                   child: TextFieldWidget(
//                       label: 'Huisnummer',
//                       text: "11",
//                       onChanged: (huisnummer) {}),
//                 ),
//                 const SizedBox(width: 20),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: TextFieldWidget(
//                       label: 'Postcode',
//                       text: "3492EK",
//                       onChanged: (postcode) {}),
//                 ),
//                 const SizedBox(width: 30),
//                 Expanded(
//                   child: TextFieldWidget(
//                       label: 'Woonplaats',
//                       text: "Breda",
//                       onChanged: (woonplaats) {}),
//                 ),
//                 const SizedBox(width: 20),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                     child: TextFieldWidget(
//                         label: 'Land',
//                         text: "Nederland",
//                         onChanged: (land) {})),
//                 const SizedBox(width: 20),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("In bezit van een rijbewijs?",
//                           style: Theme.of(context).textTheme.headline4),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Radio(
//                             activeColor: mainColor,
//                             value: "Ja",
//                             groupValue: rijbewijs,
//                             onChanged: (value) {
//                               setState(() {
//                                 rijbewijs = value.toString();
//                               });
//                             },
//                           ),
//                           Text(
//                             'Ja',
//                             style: Theme.of(context).textTheme.bodyText1,
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Radio(
//                             activeColor: mainColor,
//                             value: "Nee",
//                             groupValue: rijbewijs,
//                             onChanged: (value) {
//                               setState(() {
//                                 rijbewijs = value.toString();
//                               });
//                             },
//                           ),
//                           Text('Nee',
//                               style: Theme.of(context).textTheme.bodyText1),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 30),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("In bezit van een auto?",
//                           style: Theme.of(context).textTheme.headline4),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Radio(
//                             activeColor: mainColor,
//                             value: "Ja",
//                             groupValue: auto,
//                             onChanged: (value) {
//                               setState(() {
//                                 auto = value.toString();
//                               });
//                             },
//                           ),
//                           Text(
//                             'Ja',
//                             style: Theme.of(context).textTheme.bodyText1,
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Radio(
//                             activeColor: mainColor,
//                             value: "Nee",
//                             groupValue: auto,
//                             onChanged: (value) {
//                               setState(() {
//                                 auto = value.toString();
//                               });
//                             },
//                           ),
//                           Text('Nee',
//                               style: Theme.of(context).textTheme.bodyText1),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//               ],
//             ),
//           ],
//         ),
//       );
//
//   buildWorkshopSelect() => Container(
//         padding: EdgeInsets.all(5),
//         child: MultiSelectDialogField(
//           items: _workshopitems,
//           title:
//               Text("Workshops", style: Theme.of(context).textTheme.headline2),
//           selectedColor: mainColor,
//           decoration: BoxDecoration(
//             color: mainColor.withOpacity(0.1),
//             borderRadius: BorderRadius.all(Radius.circular(40)),
//             border: Border.all(
//               color: mainColor,
//               width: 2,
//             ),
//           ),
//           buttonIcon: const Icon(
//             Icons.accessibility,
//             color: mainColor,
//           ),
//           buttonText: Text("Workshops die je wilt geven",
//               style: Theme.of(context).textTheme.bodyText1),
//           onConfirm: (results) {
//             //_selectedAnimals = results;
//           },
//         ),
//       );
//
//   buildTargetSelect() => Container(
//         padding: EdgeInsets.all(5),
//         child: MultiSelectDialogField(
//           items: _targetitems,
//           title:
//               Text("Doelgroepen", style: Theme.of(context).textTheme.headline2),
//           selectedColor: mainColor,
//           decoration: BoxDecoration(
//             color: mainColor.withOpacity(0.1),
//             borderRadius: BorderRadius.all(Radius.circular(40)),
//             border: Border.all(
//               color: mainColor,
//               width: 2,
//             ),
//           ),
//           buttonIcon: const Icon(
//             Icons.accessibility,
//             color: mainColor,
//           ),
//           buttonText: Text("Gewenste doelgroepen",
//               style: Theme.of(context).textTheme.bodyText1),
//           onConfirm: (results) {
//             //_selectedAnimals = results;
//           },
//         ),
//       );
// }
