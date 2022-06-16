import 'package:flutter/material.dart';
import 'package:skoolworkshop/colors.dart';

class WorkshopWidget extends StatelessWidget {
  const WorkshopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              //leading: Icon(Icons.album),
              title: Text('Titel'),
              subtitle: Text('Beschrijving'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //TODO: Docent accepteert workshop, admin moet nu goedkeuren
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Icon(Icons.check),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    //TODO: Docent weigert workshop, moet uit zijn eigen lijst verdwijnen
                  },
                  style: ElevatedButton.styleFrom(
                    primary: errorColor,
                  ),
                  child: const Icon(Icons.clear),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.rol}) : super(key: key);
  final String rol;

  checkRole() {
    if(rol == "Docent") {
      return AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      );
    } else if(rol == "Medewerker") {
      return AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [

          PopupMenuButton(
            // add icon, by default "3 dot" icon
            icon: Icon(Icons.add),
              itemBuilder: (context){
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
                ];
              },
              onSelected:(value){
                if(value == 0){
                  print("opdracht");
                }else if(value == 1){
                  print("klant");
                }else if(value == 2){
                  print("workshop");
                }else if(value == 3){
                  print("locatie");
                }
              }
          ),

        ],
      );
    } else {
      return AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: checkRole(),
      body: WorkshopWidget(),
    );
  }
}

