import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AddLocationWidget extends StatefulWidget {
  const AddLocationWidget({Key? key}) : super(key: key);

  @override
  State<AddLocationWidget> createState() => _AddLocationWidgetState();
}

class _AddLocationWidgetState extends State<AddLocationWidget> {
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  final _subcodeController = TextEditingController();
  final _streetController = TextEditingController();
  final _housenumberController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Locatie info", style: Theme.of(context).textTheme.headline2,),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              labelText: 'Naam',
              labelStyle: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            controller: _countryController,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              labelText: 'Land',
              labelStyle: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            controller: _subcodeController,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              labelText: 'Postcode',
              labelStyle: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            controller: _streetController,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              labelText: 'Straat',
              labelStyle: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            controller: _housenumberController,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              labelText: 'Huisnummer',
              labelStyle: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            controller: _cityController,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              labelText: 'Plaats',
              labelStyle: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () {

          }, child: Text("Toevoegen", style: Theme.of(context).textTheme.bodyText2,), style: ElevatedButton.styleFrom(
            primary: mainColor, shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
          ),
          ),)
        ],
      ),
    );
  }
}

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text('Locatie toevoegen'),
          backgroundColor: mainColor
      ),
      body: AddLocationWidget(),
    );
  }
}

