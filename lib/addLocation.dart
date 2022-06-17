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

    locationModel res = await apiAddLocation(
        context,
        _nameController.text,
        _countryController.text,
        _subcodeController.text,
        _streetController.text,
        _housenumberController.text,
        _cityController.text);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    //   //checks if there is no error in the response body.
    //   //if error is not present, navigate the users to Login Screen.
    {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) =>
              SkoolWorkshopApp(
                rol: "Medewerker",
                emailadres: "",
              ),
        ),
      );
    }
    {
      //if error is present, display a snackbar showing the error messsage
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Added location: '),
        backgroundColor: infoColor,
      ));
    }
  }
}

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({Key? key, required this.rol, required this.emailadres})
      : super(key: key);
  final String rol;
  final String emailadres;

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
                    emailadres: emailadres,
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
