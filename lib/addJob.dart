import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

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
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Klant info",
              style: Theme.of(context).textTheme.headline2,
            ),
            // Align(child: Widget[Text("Aantal docenten", style: Theme.of(context).textTheme.titleMedium,),
            //     NumberPicker(
            //       value: _currentValue,
            //       itemHeight: 30,
            //       itemWidth: 50,
            //       minValue: 0,
            //       maxValue: 100,
            //       textStyle: Theme.of(context).textTheme.bodyText1,
            //       onChanged: (value) => setState(() => _currentValue = value),
            //     )],),
            TextField(
              controller: _salaryController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                labelText: 'Salaris',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: _starttimeController,
              readOnly: true,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                labelText: 'Kies starttijd',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                var date =  await showDatePicker(
                  context: context,
                  // theme: ThemeData(primarySwatch: Colors.pink),
                  initialDate:DateTime.now(),
                  firstDate:DateTime(1900),
                  lastDate: DateTime(2100),
                  helpText: 'Selecteer starttijd',
                  cancelText: 'Annuleer',
                  confirmText: 'Bevestig',
                );
                _starttimeController.text = date.toString().substring(0,10);
              },
            ),
            TextField(
              controller: _endtimeController,
              readOnly: true,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                labelText: 'Kies eindtijd',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                var date =  await showDatePicker(
                  context: context,
                  // theme: ThemeData(primarySwatch: Colors.pink),
                  initialDate:DateTime.now(),
                  firstDate:DateTime(1900),
                  lastDate: DateTime(2100),
                  helpText: 'Selecteer eindtijd',
                  cancelText: 'Annuleer',
                  confirmText: 'Bevestig',
                );
                _endtimeController.text = date.toString().substring(0,10);
              },
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

