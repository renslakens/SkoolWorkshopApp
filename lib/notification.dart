import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/apis.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:http/http.dart' as http;
import 'package:skoolworkshop/profileview.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final String getUnAcceptedProfilesUrl = apis.baseUrl + apis.unAcceptedDocent;
  final String deleteProfileUrl = apis.baseUrl + apis.deleteProfile;
  final String acceptDocent = apis.baseUrl + apis.acceptDocent;

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(getUnAcceptedProfilesUrl));
    return json.decode(result.body)['result'];
  }

  Future deleteUser(String id) async {
    http.Response response =
        await http.delete(Uri.parse(deleteProfileUrl + id));
    if (response.statusCode == 200) {
      print("Deleted");
    } else {
      throw "Sorry! Unable to delete this post.";
    }
  }

  Future acceptUser(String id) async {
    http.Response response = await http.put(Uri.parse(acceptDocent + id));
    if (response.statusCode == 200) {
      print('User with ID $id succesfully Accepted');
    }
  }

  int _id(dynamic user) {
    return user['docentID'];
  }

  String _naam(dynamic user) {
    return user['naam'] + " " + user['achternaam'];
  }

  String _loginEmail(dynamic user) {
    return user['loginEmail'];
  }

  String _geboortedatum(dynamic user) {
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
                return InkWell(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.account_circle, size: 40),
                          title: Text(_naam(snapshot.data[index]).toString()),
                          subtitle: Text(_loginEmail(snapshot.data[index]) + "\n" + _geboortedatum(snapshot.data[index])),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      acceptUser(
                                          _id(snapshot.data[index]).toString());
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: acceptColor,
                                  ),
                                  child: const Icon(Icons.check),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      deleteUser(
                                          _id(snapshot.data[index]).toString());
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: errorColor,
                                  ),
                                  child: const Icon(Icons.clear),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const singleProfilePage()));
                    //TODO Navigate to profiles page with _id(snapshot.data[index]).toString()
                  },
                );
                ;
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Meldingen'),
        automaticallyImplyLeading: false,
      ),
      body: NotificationWidget(),
    );
  }
}
