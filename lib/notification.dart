import 'package:flutter/material.dart';

class notificationPage extends StatelessWidget {
  const notificationPage({Key? key}) : super(key: key);

  static const String _title = "Meldingen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: const notificationWidget(),
      ),
    );
  }
}

class notificationWidget extends StatelessWidget {
  const notificationWidget({Key? key}) : super(key: key);

  static String _aangemeld = "Nieuwe gebruiker";
  static String _userData = "Gerrie peters\npetersen200@iets.com";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        children: [
          Card(
            child: OverflowBar(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        _aangemeld,
                        style: TextStyle(height: 2),
                      ),
                      subtitle: Text(
                        _userData,
                        style: TextStyle(height: 1.15),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          child: Icon(Icons.check),
                          onPressed: () {
                            //TODO implement approval of request
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            elevation: 8.0,
                          ),
                        ),
                      ),
                      ElevatedButton(
                          child: Icon(Icons.clear),
                          onPressed: () {
                            //TODO implement denial of request
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            elevation: 8.0,
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
