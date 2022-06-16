import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'colors.dart';

class AddCustomerWidget extends StatefulWidget {
  const AddCustomerWidget({Key? key}) : super(key: key);

  @override
  State<AddCustomerWidget> createState() => _AddCustomerWidgetState();
}

class _AddCustomerWidgetState extends State<AddCustomerWidget> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _subcodeController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _streetController = TextEditingController();
  final _housenumberController = TextEditingController();
  final _cityController = TextEditingController();
  final _typeController = TextEditingController();
  final _countryController = TextEditingController();
  final _contactpersonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Klant info", style: Theme.of(context).textTheme.headline2,),
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
            controller: _surnameController,
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
            controller: _phonenumberController,
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
            controller: _streetController,
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
            controller: _housenumberController,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              labelText: 'Plaats',
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
          TextField(
            controller: _typeController,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              labelText: 'Plaats',
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
              labelText: 'Plaats',
              labelStyle: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            controller: _contactpersonController,
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

class AddCustomerPage extends StatelessWidget {
  const AddCustomerPage({Key? key, required this.rol, required this.emailadres}) : super(key: key);
  final String rol;
  final String emailadres;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text('Klant toevoegen'),
          leading: GestureDetector(
            child: Icon( Icons.arrow_back,),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) => SkoolWorkshopApp(
                    rol: rol, emailadres: emailadres,
                  ),
                ),
              );
            } ,
          ),
          backgroundColor: mainColor
      ),
      body: AddCustomerWidget(),
    );
  }
}

