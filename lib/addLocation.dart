import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/api_service.dart';

import 'Model/locationModel.dart';
import 'app.dart';
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

  Future<locationModel>? _futureAddLocation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Locatie info",
              style: Theme.of(context).textTheme.headline2,
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
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
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
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
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
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
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
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
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
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
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
                labelText: 'Plaats',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _handleAddLocation();
                });
              },
              child: Text(
                "Toevoegen",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleAddLocation() async {
    future:
    _futureAddLocation;

    String postalPattern = r"^[a-z0-9][a-z0-9\- ]{0,10}[a-z0-9]$";
    RegExp postalReg = new RegExp(postalPattern);

    if(_nameController.text.isEmpty){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Vul een naam in'),
        backgroundColor: errorColor,
      ));
    }
    else if(_countryController.text.isEmpty){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Vul een land in'),
        backgroundColor: errorColor,
      ));
    }
    else if(!postalReg.hasMatch(_subcodeController.text)){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldige postcode'),
        backgroundColor: errorColor,
      ));
    }
    else if(_streetController.text.isEmpty){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Vul een straat in'),
        backgroundColor: errorColor,
      ));
    }
    else if(_housenumberController.text.isEmpty || _housenumberController.text.length > 5){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldig huisnummer'),
        backgroundColor: errorColor,
      ));
    }
    else if(_cityController.text.isEmpty){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Vul een plaats in'),
        backgroundColor: errorColor,
      ));
    }
    else {
      locationModel res = await apiAddLocation(
          context,
          _nameController.text,
          _countryController.text,
          _subcodeController.text,
          _streetController.text,
          _housenumberController.text,
          _cityController.text);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if(res.status == 201) {
        //   //checks if there is no error in the response body.
        //   //if error is not present, navigate the users to Login Screen.
        {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) =>
                  SkoolWorkshopApp(
                    rol: "Medewerker",
                    emailadres: "", voornaam: '',
                  ),
            ),
          );
        }
        {
          //if error is present, display a snackbar showing the error messsage
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Locatie is toegevoegd'),
            backgroundColor: green,
          ));
        }
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Locatie is niet toegevoegd'),
          backgroundColor: errorColor,
        ));
      }
    }
  }
}

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({Key? key, required this.rol, required this.emailadres, required this.voornaam})
      : super(key: key);
  final String rol;
  final String emailadres;
  final String voornaam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text('Locatie toevoegen'),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) =>
                      SkoolWorkshopApp(
                    rol: rol,
                    emailadres: emailadres, voornaam: voornaam,
                  ),
                ),
              );
            },
          ),
          backgroundColor: mainColor),
      body: AddLocationWidget(),
    );
  }
}
