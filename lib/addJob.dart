import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'colors.dart';

class AddJobWidget extends StatefulWidget {
  const AddJobWidget({Key? key}) : super(key: key);

  @override
  State<AddJobWidget> createState() => _AddJobWidgetState();
}

class _AddJobWidgetState extends State<AddJobWidget> {
  final _numberofteachersController = TextEditingController();
  final _salaryController = TextEditingController();
  final _starttimeController = TextEditingController();
  final _endtimeController = TextEditingController();
  final _locationController = TextEditingController();
  final _workshopController = TextEditingController();
  final _customerController = TextEditingController();
  final _taController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Opdracht info", style: Theme.of(context).textTheme.headline2,),
            TextField(
              controller: _numberofteachersController,
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
              controller: _salaryController,
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
              controller: _starttimeController,
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
              controller: _endtimeController,
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
              controller: _locationController,
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
              controller: _workshopController,
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
              controller: _customerController,
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
              controller: _taController,
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
      ),
    );
  }
}

class AddJobPage extends StatelessWidget {
  const AddJobPage({Key? key, required this.rol, required this.emailadres}) : super(key: key);
  final String rol;
  final String emailadres;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text('Opdracht toevoegen'),
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
      body: AddJobWidget(),
    );
  }
}

