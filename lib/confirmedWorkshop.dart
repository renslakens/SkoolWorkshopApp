import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skoolworkshop/addCustomer.dart';
import 'package:skoolworkshop/addJob.dart';
import 'package:skoolworkshop/addLocation.dart';
import 'package:skoolworkshop/addWorkshop.dart';
import 'package:skoolworkshop/colors.dart';
import 'package:skoolworkshop/app.dart';
import 'package:skoolworkshop/main.dart';
import 'package:skoolworkshop/apis.dart';



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
                ListTile(
                  //leading: Icon(Icons.album),
                  title: Text('Titel',
                      style: Theme.of(context).textTheme.headline3),
                  subtitle: Text('Beschrijving',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ],
            ),
          );
        });
  }
}

class ConfirmedWorkshopPage extends StatelessWidget {
  const ConfirmedWorkshopPage({Key? key}) : super(key: key);

  // checkRole() {
  //   if (rol == "Docent") {
  //     return AppBar(
  //       title: Text('Home',
  //           style: TextStyle(fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
  //       automaticallyImplyLeading: false,
  //     );
  //   } else if (rol == "Medewerker") {
  //     return AppBar(
  //       title: const Text('Home',
  //           style: TextStyle(fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
  //       automaticallyImplyLeading: false,
  //       actions: [
  //         PopupMenuButton(
  //           // add icon, by default "3 dot" icon
  //             icon: Icon(Icons.add),
  //             itemBuilder: (context) {
  //               return [
  //                 PopupMenuItem<int>(
  //                   value: 0,
  //                   child: Text("Opdracht toevoegen"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 1,
  //                   child: Text("Klant toevoegen"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 2,
  //                   child: Text("Workshop toevoegen"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 3,
  //                   child: Text("Locatie toevoegen"),
  //                 ),
  //               ];
  //             },
  //             onSelected: (value) {
  //               if (value == 0) {
  //                 Get.to(AddJobPage(rol: rol, emailadres: emailadres,));
  //                 Get.back();
  //                 Get.off(AddJobPage(rol: rol, emailadres: emailadres,));
  //               } else if (value == 1) {
  //                 Get.to(AddCustomerPage(rol: rol, emailadres: emailadres,));
  //                 Get.back();
  //                 Get.off(AddCustomerPage(rol: rol, emailadres: emailadres,));
  //               } else if (value == 2) {
  //                 Get.to(AddWorkshopPage(rol: rol, emailadres: emailadres,));
  //                 Get.back();
  //                 Get.off(AddWorkshopPage(rol: rol, emailadres: emailadres,));
  //               } else if (value == 3) {
  //                 Get.to(AddLocationPage(rol: rol, emailadres: emailadres,));
  //                 Get.back();
  //                 Get.off(AddLocationPage(rol: rol, emailadres: emailadres,));
  //               }
  //             }),
  //       ],
  //     );
  //   } else {
  //     return AppBar(
  //       title: Text('Home',
  //           style: TextStyle(fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
  //       automaticallyImplyLeading: false,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Bevestigde workshops',
            style: TextStyle(fontFamily: 'Oswald', fontSize: 28, color: Colors.black)),
        backgroundColor: mainColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pushReplacementNamed(context, '/login');}
        ),
      ),
      body: WorkshopWidget(),
    );
  }
}
