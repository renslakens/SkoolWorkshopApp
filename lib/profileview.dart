import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/apis.dart';
import 'package:http/http.dart' as http;
import 'package:skoolworkshop/colors.dart';
import 'package:skoolworkshop/main.dart';
import 'package:skoolworkshop/profileedit.dart';
import 'package:skoolworkshop/profiles.dart';

import 'Widgets/profile_widget.dart';
import 'Widgets/userprofile_widget.dart';

class singleProfilePage extends StatefulWidget {
  const singleProfilePage({Key? key, required this.emailadres})
      : super(key: key);
  final String emailadres;

  @override
  State<singleProfilePage> createState() => _singleProfilePageState();
}

class _singleProfilePageState extends State<singleProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Profiel',
              style: Theme.of(context).textTheme.headline1,
            ),
            automaticallyImplyLeading: false),
        body: UserWidget());
  }
}
