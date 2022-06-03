import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:skoolworkshop/Model/loginModel.dart';
import 'apis.dart';

// class ApiService {
  // Future<List<UserModel>?> getUsers() async {
  //   try {
  //     var url = Uri.parse(apis.baseUrl + apis.usersEndpoint);
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<UserModel> _model = userModelFromJson(response.body);
  //       return _model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  Future<loginModel> login(String naam, String lastName, String email, String wachtwoord) async {
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
      return loginModel.fromJson(jsonDecode(reponse.body));
    }
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(reponse.statusCode);
      throw Exception('Failed to create album.');
    }
  }
// }