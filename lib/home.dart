import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skoolworkshop/Model/opdrachtApplyModel.dart';
import 'package:skoolworkshop/addCustomer.dart';
import 'package:skoolworkshop/addJob.dart';
import 'package:skoolworkshop/addLocation.dart';
import 'package:skoolworkshop/addTargetAudience.dart';
import 'package:skoolworkshop/addWorkshop.dart';
import 'package:skoolworkshop/api_service.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:skoolworkshop/apis.dart';
import 'package:http/http.dart' as http;
import 'package:skoolworkshop/mailer.dart';

class WorkshopWidget extends StatefulWidget {
  const WorkshopWidget(
      {Key? key, required this.voornaam, required this.emailadres})
      : super(key: key);
  final String voornaam;
  final String emailadres;

  @override
  State<WorkshopWidget> createState() => _WorkshopWidgetState();
}

class _WorkshopWidgetState extends State<WorkshopWidget> {
  final String jobsUrl = apis.baseUrl + apis.jobRoute;
  final String getAcceptedProfilesUrl = apis.baseUrl + apis.acceptedProfiles;
  final String applyToJob = apis.baseUrl + apis.applyJob;
  DateFormat dateFormat = DateFormat("yyyy-dd-MM HH:mm:ss");
  DateFormat properDate = DateFormat("yyyy-dd-MM");

  Future<opdrachtApplyModel>? _futureApplyTeacher;

  Future<List<dynamic>> fetchJobs() async {
    var result = await http.get(Uri.parse(jobsUrl + widget.emailadres));
    return json.decode(result.body)['result'];
  }

  int _opdrachtID(dynamic job) {
    return job['opdrachtID'];
  }

  String _workshopnaam(dynamic job) {
    return job['workshopnaam'];
  }

  String _beschrijving(dynamic job) {
    return job['beschrijving'];
  }

  String _datum(dynamic job) {
    String time = job['startTijd'] ?? 0;
    var parts = time.split('T');
    var date = parts[0].trim();
    return date;
  }

  Future<void> _handleApplyToJob(String emailadres, String voornaam,
      String workshopnaam, String datum, String opdrachtID) async {
    future:
    _futureApplyTeacher;
    opdrachtApplyModel res =
        await apiApplyTeacherJob(context, widget.emailadres, opdrachtID);
    jobapply(emailadres, voornaam, workshopnaam, datum);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  Future<void> _acceptedMyDialog(context, snapshot, index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text("Inschrijven", style: Theme.of(context).textTheme.headline3),
          content: Text(
              "Weet je zeker dat je wilt inschrijven voor de workshop ${_workshopnaam(snapshot.data[index]).toString()}?"),
          actions: [
            TextButton(
              child: Text("Annuleren"),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text("Inschrijven"),
              onPressed: () {
                setState(() {
                  _handleApplyToJob(
                      widget.emailadres,
                      widget.voornaam,
                      _workshopnaam(snapshot.data[index]).toString(),
                      _datum(snapshot.data[index]).toString(),
                      _opdrachtID(snapshot.data[index]).toString());
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchJobs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              _workshopnaam(snapshot.data[index]).toString(),
                              style: Theme.of(context).textTheme.headline3),
                          subtitle: Text(
                              "Beschrijving: ${_beschrijving(snapshot.data[index]).toString()}",
                              style: Theme.of(context).textTheme.bodyText1),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _acceptedMyDialog(
                                          context, snapshot, index);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  child: const Icon(Icons.check),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => singleProfilePage(emailadres: _loginEmail((snapshot.data[index]).toString()))));
                  // },
                );
              });
        } else {
          return Padding(
              padding: const EdgeInsets.all(80.0),
              child: Center(
                child: Text(
                  "Er zijn nog een opdrachten beschikbaar waarvoor jij je kunt inschrijven",
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ));
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage(
      {Key? key,
      required this.rol,
      required this.emailadres,
      required this.voornaam})
      : super(key: key);
  final String rol;
  final String emailadres;
  final String voornaam;

  checkRole() {
    if (rol == "Docent") {
      return AppBar(
        title: Text('Home',
            style: TextStyle(
                fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
        automaticallyImplyLeading: false,
      );
    } else if (rol == "Medewerker") {
      return AppBar(
        title: const Text('Home',
            style: TextStyle(
                fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              icon: Icon(Icons.add),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Opdracht toevoegen"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Klant toevoegen"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Workshop toevoegen"),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text("Locatie toevoegen"),
                  ),
                  PopupMenuItem<int>(
                    value: 4,
                    child: Text("Doelgroep toevoegen"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  Get.to(AddJobPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                  Get.back();
                  Get.off(AddJobPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                } else if (value == 1) {
                  Get.to(AddCustomerPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                  Get.back();
                  Get.off(AddCustomerPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                } else if (value == 2) {
                  Get.to(AddWorkshopPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                  Get.back();
                  Get.off(AddWorkshopPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                } else if (value == 3) {
                  Get.to(AddLocationPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                } else if (value == 3) {
                  Get.to(AddTAPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                  Get.back();
                  Get.off(AddLocationPage(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ));
                }
              }),
        ],
      );
    } else {
      return AppBar(
        title: Text('Home',
            style: TextStyle(
                fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
        automaticallyImplyLeading: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: checkRole(),
      body: WorkshopWidget(
        emailadres: emailadres,
        voornaam: voornaam,
      ),
    );
  }
}
