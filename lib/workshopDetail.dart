import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/apis.dart';
import 'colors.dart';
import 'package:http/http.dart' as http;
import 'package:skoolworkshop/colors.dart';


class WorkshopWidget extends StatelessWidget {

  WorkshopWidget({Key? key}) : super(key: key);

  final String apiUrl = apis.baseUrl + apis.getWorkshopDetail + "1";

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(Uri.parse(apiUrl));
    print(result.body);
    return json.decode(result.body)['result'];

  }

  String _naam(dynamic workshop){
    return workshop['naam'] ?? "Onbekende workshop";
  }

  String _beschrijving(dynamic workshop){
    return workshop['beschrijving'] ?? "Geen beschrijving meegegeven";
  }

  int _aantalDocenten(dynamic job){
    return job['aantalDocenten'] ?? 0;
  }

  int _salarisIndicatie(dynamic job){
    return job['salarisIndicatie'] ?? 0;
  }

  DateTime _startTijd(dynamic job){
    // print(job['startTijd'].toString());
    return job['startTijd'] ?? 0;
  }

  DateTime _eindTijd(dynamic job){
    return job['eindTijd'] ?? 0;
  }

  // DateTime _naamLocatie(dynamic location){
  //   // print(job['startTijd'].toString());
  //   return location[''] ?? 0;
  // }

  String _land(dynamic location){
    return location['land'] ?? "Niet opgegeven";
  }

  String _postcode(dynamic location){
    return location['postcode'] ?? "Niet opgegeven";
  }
  String _straat(dynamic location){
    return location['straat'] ?? "Niet opgegeven";
  }

  String _huisnummer(dynamic location){
    return location['huisnummer'] ?? "Niet opgegeven";
  }

  String _plaats(dynamic location){
    return location['plaats'] ?? "Niet opgegeven";
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(

      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(

              // padding: const EdgeInsets.all(8),
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return
                  Column(children: <Widget>[
              Row(
                //ROW 1
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 25.0, top: 25.0),
                      child: Text(
                        _naam(snapshot.data[index]).toString(),
                        style: Theme.of(context).textTheme.bodyText1)
                      )
                ]
                ),
                Row(//ROW 2
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _beschrijving(snapshot.data[index]).toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),

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
                          margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.schedule),
                                  Text(
                                    "d",
                                    // _startTijd(snapshot.data[index]).toString(),
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),

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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.location_on),
                                  Text(
                                        _plaats(snapshot.data[index]).toString()+ ", ",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                      _straat(snapshot.data[index]).toString()+ " ",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    _huisnummer(snapshot.data[index]).toString(),
                                    style: Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              )
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),

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
                          margin: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.euro),
                                  Text(
                                    _salarisIndicatie(snapshot.data[index]).toString(),
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              )
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),

                          ) //BoxDecor
                      ),

                    )
                  ]),
                ElevatedButton(
                  child: Text('Inschrijven' ,
                      style: Theme.of(context).textTheme.bodyText2),
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
                ),
                ],
                  );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class WorkshopDetailPage extends StatelessWidget {
  const WorkshopDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Workshop'),
        automaticallyImplyLeading: false,
      ),
      body: WorkshopWidget(),
    );
  }
}