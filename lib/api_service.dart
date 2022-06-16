import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skoolworkshop/Model/loginModel.dart';
import 'package:skoolworkshop/Model/registerModel.dart';
import 'package:skoolworkshop/Model/userModel.dart';
import 'package:skoolworkshop/colors.dart';
import 'apis.dart';

// class ApiService {
//   Future<List<UserModel>?> getUsers() async {
//     try {
//       var url = Uri.parse(apis.baseUrl + apis.usersEndpoint);
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<UserModel> _model = userModelFromJson(response.body) as List<UserModel>;
//         return _model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
Future<loginModel> login(
    String naam, String lastName, String email, String wachtwoord) async {
  final reponse = await http.post(
    Uri.parse(apis.baseUrl + apis.login),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'naam': naam,
      'achternaam': lastName,
      'emailadres': email,
      'wachtwoord': wachtwoord
    }),
  );
  if (reponse.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("test");
    return loginModel.fromJson(jsonDecode(reponse.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print(reponse.statusCode);
    // return errorFile.fromJson(jsonDecode(reponse.body));
    throw Exception('Failed to create album.');
  }
}

// Future<workshopDetail> getWorkshopDetail(String id) async {
//   final reponse = await http.post(
//     Uri.parse(apis.baseUrl + apis.getWorkshopDetail + id),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );
//   if (reponse.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     print("test");
//     return workshopDetail.fromJson(jsonDecode(reponse.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     print(reponse.statusCode);
//     // return errorFile.fromJson(jsonDecode(reponse.body));
//     throw Exception('Failed to create album.');
//   }
// }

uploadFile(String filePath) async {
  var file = http.MultipartFile.fromBytes(
      'file', await File.fromUri(Uri.parse(filePath)).readAsBytes());
  final reponse = await http.post(
    Uri.parse(apis.baseUrl + apis.fileUpload),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, http.MultipartFile>{'file': file}),
  );
  if (reponse.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return loginModel.fromJson(jsonDecode(reponse.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print(reponse.statusCode);
    throw Exception('Failed to create album.');
  }
}

Future<loginModel> apiLogin(
    BuildContext context, String email, String wachtwoord) async {
  final reponse = await http
      .post(
    Uri.parse(apis.baseUrl + apis.login),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'emailadres': email, 'wachtwoord': wachtwoord}),
  )
      .catchError((onError) {
    print(onError);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Kon geen verbinding maken'),
      backgroundColor: errorColor,
      duration: Duration(seconds: 30),
    ));
  });
  switch (reponse.statusCode) {
    case 200:
      ScaffoldMessenger.of(context).clearSnackBars();
      print(reponse.statusCode);
      return loginModel.fromJson(jsonDecode(reponse.body));
    case 401:
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldig wachtwoord'),
        backgroundColor: errorColor,
      ));
      throw Exception('Invalid password');
    case 404:
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldige email'),
        backgroundColor: errorColor,
      ));
      throw Exception('Could not find emailaddress');
    default:
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invalide gegevens'),
        backgroundColor: errorColor,
      ));
      throw Exception("Could not log in");
  }
}

Future<registerModel> apiRegister(
    BuildContext context, String voornaam, String achternaam, String email, String wachtwoord, String geboortedatum, String geboorteplaats, String heeftRijbewijs, String heeftAuto, String straat, String huisnummer, String geslacht, String nationaliteit, String woonplaats, String postcode, String land, String doelgroep, String rol ) async {
  final reponse = await http
      .post(
    Uri.parse(apis.baseUrl + apis.register),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'naam': voornaam, 'achternaam': achternaam, 'emailadres': email, 'wachtwoord': wachtwoord, 'geboortedatum': geboortedatum, 'geboorteplaats': geboorteplaats, 'heeftRijbewijs': heeftRijbewijs, 'heeftAuto': heeftAuto, 'straat': straat, 'huisnummer': huisnummer, 'geslacht': geslacht, 'nationaliteit': nationaliteit, 'woonplaats': woonplaats, 'postcode': postcode, 'land': land, 'doelgroep':doelgroep, 'rol':rol }),
  )
      .catchError((onError) {
    print(onError);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Kon geen verbinding maken'),
      backgroundColor: errorColor,
      duration: Duration(seconds: 30),
    ));
  });
  switch (reponse.statusCode) {
    case 201:
      ScaffoldMessenger.of(context).clearSnackBars();
      print(reponse.statusCode);
      return registerModel.fromJson(jsonDecode(reponse.body));
    case 401:
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldig wachtwoord'),
        backgroundColor: errorColor,
      ));
      throw Exception('Invalid password');
    case 404:
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldige email'),
        backgroundColor: errorColor,
      ));
      throw Exception('Could not find emailaddress');
    default:
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invalide gegevens'),
        backgroundColor: errorColor,
      ));
      throw Exception("Could not register");
  }
}
