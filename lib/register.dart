import 'dart:convert';
//import 'dart:html';

//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
//import 'package:open_file/open_file.dart';
import 'colors.dart';

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
                      // helpText: 'Select birth date',
                      // cancelText: 'poep',
                      // confirmText: 'Confirm',
                  );
                  _birthDateController.text = date.toString().substring(0,10);
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
                obscureText: true,
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
                obscureText: true,
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
                obscureText: true,
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
                obscureText: true,
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
                  controller: _countryController,
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
                  controller: _countryController,
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
                      value: "male",
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
                      value: "female",
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
                      value: "male",
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
                      value: "female",
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
}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('register'),
  //     ),
  //     body: SafeArea(
  //       child: ListView(
  //         padding: const EdgeInsets.symmetric(horizontal: 24.0),
  //         children: <Widget>[
  //
  //           const SizedBox(height:35.0),
  //           Image.asset('assets/images/Skool-Workshop_Logo.png'),
  //
  //           const SizedBox(height: 60.0),
  //           TextField(
  //             controller: _nameController,
  //             cursorColor: mainColor,
  //             decoration: InputDecoration(
  //               labelText: 'Voornaam',
  //               labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
  //               focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
  //             ),
  //           ),
  //
  //           const SizedBox(height: 12.0),
  //           TextField(
  //             decoration: InputDecoration(
  //               labelText: 'Achternaam',
  //               labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
  //               focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
  //             ),
  //           ),
  //
  //           const SizedBox(height: 12.0),
  //           TextField(
  //             decoration: InputDecoration(
  //               labelText: 'E-mail',
  //               labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
  //               focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
  //             ),
  //           ),
  //
  //           const SizedBox(height: 12.0),
  //           TextField(
  //             obscureText: !this._showPassword,
  //             decoration: InputDecoration(
  //               labelText: 'Wachtwoord',
  //               labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
  //               focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
  //
  //               suffixIcon: IconButton(
  //                 icon: Icon(
  //                   Icons.remove_red_eye,
  //                   color: this._showPassword ? Colors.blue : Colors.grey,
  //                 ),
  //                 onPressed: () {
  //                   setState(() => this._showPassword = !this._showPassword);
  //                 },
  //               ),
  //             ),
  //           ),
  //
  //           const SizedBox(height: 50.0),
  //           ElevatedButton(
  //             child: const Text('Terug'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             style: ElevatedButton.styleFrom(
  //               elevation: 8.0,
  //               primary: mainColor,
  //               shape: const RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(100.0)),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
// }
