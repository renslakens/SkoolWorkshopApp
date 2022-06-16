import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AddWorkshopWidget extends StatefulWidget {
  const AddWorkshopWidget({Key? key}) : super(key: key);

  @override
  State<AddWorkshopWidget> createState() => _AddWorkshopWidgetState();
}

class _AddWorkshopWidgetState extends State<AddWorkshopWidget> {
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Workshop info", style: Theme.of(context).textTheme.headline2,),
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
              labelText: 'Beschrijving',
              labelStyle: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
              ),
            ),
            keyboardType: TextInputType. multiline,
            maxLines: null,
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

class AddWorkshopPage extends StatelessWidget {
  const AddWorkshopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text('Workshop toevoegen'),
          backgroundColor: mainColor
      ),
      body: AddWorkshopWidget(),
    );
  }
}

