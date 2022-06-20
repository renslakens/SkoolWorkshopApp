import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/apis.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:http/http.dart' as http;
import 'package:skoolworkshop/profileview.dart';
import 'package:intl/intl.dart';

class NotificationWidget extends StatefulWidget {
  NotificationWidget({Key? key}) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final String getUnAcceptedProfilesUrl = apis.baseUrl + apis.unAcceptedProfiles;
  final String deleteDocent = apis.baseUrl + apis.authRoute;
  final String acceptDocent = apis.baseUrl + apis.authRoute;
  DateFormat dateFormat = DateFormat("yyyy-dd-MM HH:mm:ss");
  DateFormat properDate = DateFormat("yyyy-dd-MM");

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(getUnAcceptedProfilesUrl));
    return json.decode(result.body)['result'];
  }

  Future delDocent(String emailLogin) async {
    http.Response response = await http.delete(Uri.parse(deleteDocent + emailLogin));
    if (response.statusCode == 200) {
      print("Deleted");
    } else {
      throw "Sorry! Unable to delete this post.";
    }
  }

  Future accDocent(String emailLogin) async {
    http.Response response = await http.put(Uri.parse(acceptDocent + emailLogin));
    if (response.statusCode == 200) {
      print('User with ID $emailLogin successfully Accepted');
    }
  }

  int _id(dynamic user) {
    return user['docentID'];
  }

  // String _naam(dynamic user) {
  //   return user['naam'] + " " + user['achternaam'];
  // }

  String _loginEmail(dynamic user) {
    return user['emailadres'];
  }

  String _rol(dynamic user) {
    return user['rol'];
  }

  // String _geboortedatum(dynamic user) {
  //   String geboortedatum = user['geboortedatum'] ?? 0;
  //   DateTime newtime = dateFormat.parse(geboortedatum.replaceAll("T", " "));
  //   return properDate.format(newtime);
  // }

  Future<void> _acceptedMyDialog(context, snapshot, index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Goedkeuren",
              style: Theme.of(context).textTheme.headline3),
          content: Text(
              "Weet je zeker dat je ${_loginEmail(snapshot.data[index])} toegang wilt geven tot de app?",
          style: Theme.of(context).textTheme.bodyText1),
          actions: [
            TextButton(
              child: Text("Annuleer"),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text("Geef toegang"),
              onPressed: () {
                setState(() {
                  accDocent(_loginEmail(snapshot.data[index]).toString());
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _denyMyDialog(context, snapshot, index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Goedkeuren",
              style: Theme.of(context).textTheme.headline3),
          content: Text(
              "Weet je zeker dat je ${_loginEmail(snapshot.data[index])} wilt verwijderen?",
              style: Theme.of(context).textTheme.bodyText1),
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
                  delDocent(_loginEmail(snapshot.data[index]).toString());
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
                return InkWell(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.account_circle, size: 40),
                          title: Text(_loginEmail(snapshot.data[index]).toString(),
                              style: Theme.of(context).textTheme.subtitle1),
                          subtitle: Text(
                              "Rol: ${_rol(snapshot.data[index])}",
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
                              ]),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => singleProfilePage(emailadres: _loginEmail((snapshot.data[index]).toString()))));
                    //TODO Navigate to profiles page with _id(snapshot.data[index]).toString()
                  },
                );
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
        title: Text('Meldingen',
            style: TextStyle(fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
        automaticallyImplyLeading: false,
      ),
      body: NotificationWidget(),
    );
  }
}
