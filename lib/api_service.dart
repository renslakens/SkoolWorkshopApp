import 'dart:convert';
import 'dart:developer';

import 'package:skoolworkshop/Model/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:skoolworkshop/Model/loginModel.dart';
import 'apis.dart';

  Future<loginModel> login(String naam, String lastName, String email, String wachtwoord) async {
    final response = await http.post(
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
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return loginModel.fromJson(jsonDecode(response.body));
    }
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to create album.');
    }
  }
    Future<loginModel> apiLogin(String email, String wachtwoord) async {
      final response = await http.post(
        Uri.parse(apis.baseUrl + apis.login),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'emailadres': email,
          'wachtwoord': wachtwoord
        }),
      );
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        print(response.statusCode);
        return loginModel.fromJson(jsonDecode(response.body));
      }
      else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        print(response.statusCode);
        throw Exception('Failed to login.');
      }
  }

// class ApiService {
//
//   Future<List<UserModel>> getUsers() async {
//     try {
//       var url = Uri.parse(apis.baseUrl + apis.getUsers);
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<UserModel> model = List<UserModel>.from( JsonResult['result'].map( (x) => UserModel.fromJson(x)));        return model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
// }