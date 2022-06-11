import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skoolworkshop/apis.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:http/http.dart' as http;

class ProfileWidget extends StatelessWidget {

  ProfileWidget({Key? key}) : super(key: key);

  final String apiUrl = apis.baseUrl + apis.profiles;

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];

  }

  String _naam(dynamic user){
    return user['naam'] + " " +  user['achternaam'];

  }

  String _emailadres(dynamic user){
    return user['emailadres'];
  }

  String _geboortedatum(dynamic user){
    return "Geboortedatum: " + user['geboortedatum'].toString();
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
                          title: Text(_naam(snapshot.data[index])),
                          subtitle: Text(_emailadres(snapshot.data[index])),
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
                                    //TODO: Docent verwijdert de user
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
