import 'package:flutter/material.dart';
//import 'tempCardData.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  //static const userData = ['Patrick', 'Erik', 'Patty', 'Arend'];
  static const userDes = ['email@email.com', 'maile@mail2.com', 'meel@meel.com', 'aasdb@absd.com'];
  static const String _title = "Meldingen";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userDes.length,
      itemBuilder: (context, index) {
        return Card(
          child: OverflowBar(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    title: Text(userDes[index], style: TextStyle(height: 1.15),),
                    subtitle: Text(userDes[index], style: TextStyle(height: 1.15),),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            //TODO implement approval of request
                          },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 8.0,
                          ),
                          child: const Icon(Icons.check),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            onPressed: () {
                              //TODO implement denial of request
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              elevation: 8.0,
                            ),
                            child: const Icon(Icons.clear),
                      ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },

      padding: const EdgeInsets.symmetric(horizontal: 12.0),
    );
  }
}

//class notificationWidget extends StatelessWidget {
// const notificationWidget({Key? key}) : super(key: key);

//  @override
//   Widget build(BuildContext context) {
//
//   }
// }

// Card buildCard() {
//   var tempCardData = tempCardData.getData;


//}