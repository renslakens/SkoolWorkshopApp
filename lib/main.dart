import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:skoolworkshop/Model/workShopDetailModel.dart';
import 'package:skoolworkshop/addCustomer.dart';
import 'package:skoolworkshop/awaitingprofile.dart';
import 'package:skoolworkshop/profiles.dart';
import 'package:skoolworkshop/profileview.dart';
import 'package:skoolworkshop/register.dart';
import 'package:skoolworkshop/theme.dart';
import 'package:skoolworkshop/workshopDetail.dart';

import 'addLocation.dart';
import 'addWorkshop.dart';
import 'app.dart';
import 'home.dart';
import 'login.dart';
import 'notification.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SkoolWorkshop',
      theme: customLightTheme(),
      initialRoute: '/login',
      routes: {
        '/workshop' : (BuildContext context) => WorkshopDetailPage(),
        '/notification' : (BuildContext context) => const NotificationPage(emailadres: '',),
        '/login': (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const RegisterPage(rol: "",),
        '/': (BuildContext context) => const SkoolWorkshopApp(rol: "", emailadres: ""),
        '/awaiting': (BuildContext context) => const awaitingProfile(),
        '/profiles': (BuildContext context) => const ProfilePage(),
        '/profile' : (BuildContext context) => singleProfilePage(emailadres: ""),
        '/addlocation' : (BuildContext context) => const AddLocationPage(rol: "", emailadres: "",),
        '/addworkshop' : (BuildContext context) => const AddWorkshopPage(rol: "", emailadres: "",),
        '/addcustomer' : (BuildContext context) => const AddCustomerPage(rol: "", emailadres: "",),
      },
    );
  }
}