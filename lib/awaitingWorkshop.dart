import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skoolworkshop/addCustomer.dart';
import 'package:skoolworkshop/addJob.dart';
import 'package:skoolworkshop/addLocation.dart';
import 'package:skoolworkshop/addWorkshop.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:http/http.dart' as http;
import 'package:skoolworkshop/app.dart';
import 'package:skoolworkshop/main.dart';
import 'package:skoolworkshop/apis.dart';

class WorkshopWidget extends StatefulWidget {
  const WorkshopWidget({Key? key, required this.voornaam, required this.emailadres}) : super(key: key);
  final String voornaam;
  final String emailadres;

  @override
  State<WorkshopWidget> createState() => _WorkshopWidgetState();
}

class _WorkshopWidgetState extends State<WorkshopWidget> {
  final String jobURL = apis.baseUrl + apis.jobRoute;

  Future<List<dynamic>> fetchWorkshops() async {
    String finalUrl = jobURL + apis.emailWorkshops + widget.emailadres + apis.isBevestigd + "1";
    print(finalUrl);
    var result = await http.get(Uri.parse(finalUrl));
    return json.decode(result.body)['result'];
  }

  String _workshopnaam(dynamic job) {
    return job['workshopnaam'];
  }

  String _beschrijving(dynamic job) {
    return job['beschrijving'];
  }

  @override
  Widget build(BuildContext context) {
    //return Center(child: Text(finalUrl);
    return FutureBuilder<List<dynamic>>(
      future: fetchWorkshops(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(snapshot.hasData);
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
                  "Er zijn geen workshops van jou in afwachting voor goedkeuring",
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ));
        }
      },
    );
  }
}

class AwaitingWorkshopPage extends StatelessWidget {
  const AwaitingWorkshopPage({Key? key, required this.voornaam, required this.emailadres}) : super(key: key);
  final String voornaam;
  final String emailadres;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Workshops in afwachting',
            style: TextStyle(fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
      ),
      body: WorkshopWidget(voornaam: voornaam, emailadres: emailadres,),
    );
  }
}
