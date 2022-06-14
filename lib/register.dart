import 'dart:convert';
//import 'dart:html';

//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:skoolworkshop/Model/registerModel.dart';
import 'package:skoolworkshop/api_service.dart';
//import 'package:open_file/open_file.dart';
import 'app.dart';
import 'colors.dart';
import 'package:intl/intl.dart';

import 'login.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);



  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class Workshop {
  final int id;
  final String name;

  Workshop({
    required this.id,
    required this.name,
  });
}

class _RegisterPageState extends State<RegisterPage> {

  static List<Workshop> _workshops = [
    Workshop(id: 1, name: "Bootcamp"),
    Workshop(id: 2, name: "Caribbean Drums"),
    Workshop(id: 3, name: "Flashmob"),
    Workshop(id: 4, name: "Ghetto Drums"),
    Workshop(id: 5, name: "HiipHop"),
    Workshop(id: 6, name: "Light Graffiti"),
    Workshop(id: 7, name: "Moderene Dans"),
    Workshop(id: 8, name: "Pannavoetbal"),
    Workshop(id: 9, name: "Photoshop"),
    Workshop(id: 10, name: "Rap"),
    Workshop(id: 11, name: "Smartphone Fotografie"),
    Workshop(id: 12, name: "Soap Acteren"),
    Workshop(id: 13, name: "Stage Fighting"),
    Workshop(id: 14, name: "Streetdance"),
    Workshop(id: 15, name: "Theatersport"),
    Workshop(id: 16, name: "T-shirt Ontwewrpen"),
    Workshop(id: 17, name: "Videoclip Maken"),
    Workshop(id: 18, name: "Zelfverdediging"),
    Workshop(id: 19, name: "Breakdance"),
    Workshop(id: 20, name: "Dance-Fit"),
    Workshop(id: 21, name: "Freerunning"),
    Workshop(id: 22, name: "Graffiti"),
    Workshop(id: 23, name: "Kickboksen"),
    Workshop(id: 24, name: "Live Looping"),
    Workshop(id: 25, name: "Percussie"),
    Workshop(id: 26, name: "Popstar"),
    Workshop(id: 27, name: "Stepping"),
    Workshop(id: 28, name: "Stop Motion"),
    Workshop(id: 29, name: "Vloggen"),
  ];

  final _items = _workshops
      .map((workshop) => MultiSelectItem<Workshop>(workshop, workshop.name))
      .toList();

  final _multiSelectKey = GlobalKey<FormFieldState>();

  Future<registerModel>? _futureRegister;
  final DateFormat dateFormat = DateFormat("yyyy-dd-MM HH:mm:ss");
  String? formattedDate;

  int _activeCurrentStep = 0;
  String? gender;
  String? drivers_liscence;
  String? car;
  // bool _showPassword = false;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _mobilePhoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _kvkNumberController = TextEditingController();
  final _btwNumberController = TextEditingController();

  List<Step> stepList() => [
    Step(
        state: _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
        isActive: _activeCurrentStep >= 0,
        title: const Text('Stap 1'),
        content: Container(
          child: Column(
            children: [

              Text("Inloggegevens", style: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),

              TextField(
                controller: _firstNameController,
                cursorColor: mainColor,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Voornaam',
                  labelStyle: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Achternaam',
                  labelStyle: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Wachtwoord',
                  labelStyle: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )),

    Step(
        state:_activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeCurrentStep >= 1,
        title: const Text('Stap 2'),
        content: Container(
          child: Column(
            children: [

              Text("Persoonlijke gegevens", style: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),
              const SizedBox(
                height: 12,
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Geslacht:",
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                    fontSize: 18.0,
                    ),
                ),
              ),

                  ListTile(
                    title: Text("Man"),
                    leading: Radio(
                        value: "male",
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                  ),

                  ListTile(
                    title: Text("Vrouw"),
                    leading: Radio(
                        value: "female",
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                  ),

              TextField(
                controller: _birthDateController,
                readOnly: true,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Kies geboortedatum',
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
                      helpText: 'Selecteer geboortedatum',
                      cancelText: 'Annuleer',
                      confirmText: 'Bevestig',
                  );
                  // _birthDateController.text = date.toString().substring(0,10);
                  DateTime _birthDateController = DateTime.now();
                  String formattedDate = DateFormat('yyyy-MM-dd').format(_birthDateController);
                },
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _birthPlaceController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Geboorteplaats',
                  labelStyle: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _mobilePhoneController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Mobiel nummer',
                  labelStyle: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'bestand uploaden',
                  labelStyle: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Text("Adres", style: TextStyle(
                fontFamily: 'Heebo',
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),
              const SizedBox(
                height: 12,
              ),

              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Straat + nr.',
                  labelStyle: TextStyle(
                    fontFamily: 'Heebo',
                    color: Colors.black,
                  ),
                ),
              ),

              TextField(
                controller: _pincodeController,
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
                controller: _cityController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                  labelText: 'Woonplaats',
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

            ],
          ),
        )),

    Step(
        state:_activeCurrentStep <= 2 ? StepState.editing : StepState.complete,
        isActive: _activeCurrentStep >= 2,
        title: const Text('Stap 3'),
        content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Info workshopdocent", style: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(
                  height: 12,
                ),

                TextField(
                  controller: _kvkNumberController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                    labelText: 'KVK Nummer',
                    labelStyle: TextStyle(
                      fontFamily: 'Heebo',
                      color: Colors.black,
                    ),
                  ),
                ),

                TextField(
                  controller: _btwNumberController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                    labelText: 'Btw, indentificatienummer',
                    labelStyle: TextStyle(
                      fontFamily: 'Heebo',
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                ListTile(
                  title: ElevatedButton(
                    child: const Text('Uploaden',
                        style: TextStyle(fontFamily: 'Heebo')),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                      primary: mainColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      ),
                    ),
                  ),
                  leading: Text("Kopie ID toevoegen:", style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 17.0,
                    color: Colors.black,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),

                ListTile(
                  title: ElevatedButton(
                    child: const Text('Uploaden',
                        style: TextStyle(fontFamily: 'Heebo')),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                      primary: mainColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      ),
                    ),
                  ),
                  leading: Text("Vog toevoegen:", style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 17.0,
                    color: Colors.black,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),

                Text("Rijbewijs?", style: TextStyle(
                  fontFamily: 'Heebo',
                  fontSize: 17.0,
                  color: Colors.black,
                )),

                ListTile(
                  title: Text("Ja"),
                  leading: Radio(
                      value: "Yes",
                      groupValue: drivers_liscence,
                      onChanged: (value){
                        setState(() {
                          drivers_liscence = value.toString();
                        });
                      }),
                ),

                ListTile(
                  title: Text("Nee"),
                  leading: Radio(
                      value: "No",
                      groupValue: drivers_liscence,
                      onChanged: (value){
                        setState(() {
                          drivers_liscence = value.toString();
                        });
                      }),
                ),
                const SizedBox(
                  height: 12,
                ),

                Text("Bezit van auto?", style: TextStyle(
                  fontFamily: 'Heebo',
                  fontSize: 17.0,
                  color: Colors.black,
                )),


                ListTile(
                  title: Text("Ja"),
                  leading: Radio(
                      value: "Yes",
                      groupValue: car,
                      onChanged: (value){
                        setState(() {
                          car = value.toString();
                        });
                      }),
                ),

                ListTile(
                  title: Text("Nee"),
                  leading: Radio(
                      value: "No",
                      groupValue: car,
                      onChanged: (value){
                        setState(() {
                          car = value.toString();
                        });
                      }),
                ),
                const SizedBox(
                  height: 12,
                ),

                MultiSelectDialogField(
                  items: _items,
                  title: Text("Workshops"),
                  selectedColor: Colors.orangeAccent,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      color: Colors.orangeAccent,
                      width: 2,
                    ),
                  ),
                  buttonIcon: Icon(
                    Icons.accessibility,
                    color: Colors.orangeAccent,
                  ),
                  buttonText: Text(
                    "Workshops die je wilt geven",
                    style: TextStyle(
                      color: Colors.orangeAccent[800],
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {
                    //_selectedAnimals = results;
                  },
                ),
                SizedBox(height: 50),

              ],
            )
        )
   )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Registratie'),
        backgroundColor: mainColor
      ),
      body: Theme(
      data: ThemeData(
    primarySwatch: Colors.orange,
    colorScheme: ColorScheme.light(
    primary: mainColor,
    )
    ),

      child:
      Stepper(
        type: StepperType.horizontal,
        currentStep: _activeCurrentStep,
        steps: stepList(),

        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }else{
              _handleRegister();
          }
        },

        // onStepCancel takes us to the previous step
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },

        // onStepTap allows to directly click on the particular step we want
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
      ),
    );
  }

  Future<void> _handleRegister() async {
    _futureRegister = apiRegister(context, _firstNameController.text.toString(), _lastNameController.text.toString(), _emailController.text.toString(),
    _passwordController.text.toString(), gender.toString(), formattedDate.toString(), _birthPlaceController.text.toString(), _mobilePhoneController.text.toString(), _addressController.text.toString(), _pincodeController.text.toString(), _cityController.text.toString(), _countryController.text.toString(), _kvkNumberController.text.toString(), _btwNumberController.text.toString(), drivers_liscence.toString(), car.toString());
    print("loginDetails: " +
    _emailController.text +
    ', ' +
    _passwordController.text);

    future:
    _futureRegister;

    registerModel res = await apiRegister(
    context, _firstNameController.text, _lastNameController.text, _emailController.text, _passwordController.text, gender.toString(), formattedDate.toString(), _birthPlaceController.text, _mobilePhoneController.text, _addressController.text, _pincodeController.text, _cityController.text, _countryController.text, _kvkNumberController.text, _btwNumberController.text, drivers_liscence.toString(), car.toString());
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    //   //checks if there is no error in the response body.
    //   //if error is not present, navigate the users to Login Screen.

    {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const LoginPage()));
    }
    {
    //if error is present, display a snackbar showing the error messsage
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Error: '),
    backgroundColor: errorColor,
    ));
    }

  }
  }

// class DateFormat {
//   DateFormat(String s);
//
//   String format(TextEditingController birthDateController) {}
// }

