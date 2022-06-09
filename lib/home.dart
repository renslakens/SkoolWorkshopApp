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
                    primary: Colors.red,
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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: WorkshopWidget(),
    );
  }
}

