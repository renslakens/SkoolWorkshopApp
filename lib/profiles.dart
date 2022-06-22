import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/apis.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:http/http.dart' as http;

import 'mailer.dart';

class ProfileWidget extends StatefulWidget {

  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final String getAcceptedProfilesUrl = apis.baseUrl + apis.acceptedProfiles;
  final String deleteProfileUrl = apis.baseUrl + apis.authRoute;

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(Uri.parse(getAcceptedProfilesUrl));
    return json.decode(result.body)['result'];

  }

  Future deleteUser(String emailadres, String voornaam) async {
    accountdeleted(emailadres, voornaam);
    http.Response response = await http.delete(Uri.parse(deleteProfileUrl + emailadres));
    if (response.statusCode == 200) {
      print("Deleted");
    } else {
      throw "Sorry! Unable to delete this post.";
    }
  }

  String _rol(dynamic user){
    return user['rol'];
  }

  String _emailadres(dynamic user){
    return user['emailadres'];
  }

  String _voornaam(dynamic user) {
    return user['voornaam'];
  }

  Future<void> _denyMyDialog(context, snapshot, index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Goedkeuren"),
          content: Text(
              "Weet je zeker dat je ${_emailadres(snapshot.data[index])} wilt verwijderen?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Verwijder"),
              onPressed: () {
                setState(() {
                  deleteUser(_emailadres(snapshot.data[index]).toString(), _voornaam(snapshot.data[index]).toString());
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
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.account_circle, size: 40),
                          title: Text(_emailadres(snapshot.data[index]).toString()),
                          subtitle: Text("Rol: ${_rol(snapshot.data[index])}"),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    //TODO: Docent wil profiel wijzigen
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: infoColor,
                                  ),
                                  child: const Icon(Icons.edit),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _denyMyDialog(context, snapshot, index);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: errorColor,
                                  ),
                                  child: const Icon(Icons.clear),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Profielen'),
        automaticallyImplyLeading: false,
      ),
      body: ProfileWidget(),
    );
  }
}

