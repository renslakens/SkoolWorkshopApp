//import 'dart:html';

//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
//import 'package:open_file/open_file.dart';
import 'Model/registerModel.dart';
import 'api_service.dart';
import 'app.dart';
import 'colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.rol}) : super(key: key);
  final String rol;

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

  Future<registerModel>? _futureRegister;

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
                        value: "man",
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
                        value: "vrouw",
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
                      cancelText: 'Anulleer',
                      confirmText: 'Bevestig',
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

                ListTile(
                  title: ElevatedButton(
                    child: const Text('Uploaden',
                        style: TextStyle(fontFamily: 'Heebo')),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(rol: "",)),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(rol: "",)),
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
                      value: "ja",
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
                      value: "nee",
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
                      value: "ja",
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
                      value: "nee",
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
          } else  {
            setState(() {
              _handleRegister();
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

        controlsBuilder: (BuildContext context, ControlsDetails details){
          return Row(
            children: <Widget>[
              ElevatedButton(
                child: const Text('Bevestig',
                    style: TextStyle(fontFamily: 'Heebo')),
                onPressed: details.onStepContinue,
                style: ElevatedButton.styleFrom(
                  elevation: 8.0,
                  primary: mainColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: const Text('Annuleer',
                    style: TextStyle(fontFamily: 'Heebo')),
                onPressed: details.onStepCancel,
                style: ElevatedButton.styleFrom(
                  elevation: 8.0,
                  primary: mainColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                ),
              ),
              ),
            ],
          );
        },

      ),
      ),
    );
  }


  Future<void> _handleRegister() async {
    if (!(_emailController.text.toString().contains("@"))) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldige email'),
        backgroundColor: errorColor,
      ));
    } else if (!(_passwordController.text.length > 7)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldig wachtwoord'),
        backgroundColor: errorColor,
      ));
    } else {

      future:
      _futureRegister;

      registerModel res = await apiRegister(
          context, _firstNameController.text, _lastNameController.text, _emailController.text, _passwordController.text, gender.toString(), 'nederlands', _birthDateController.text, _birthPlaceController.text, _addressController.text, '1', _pincodeController.text, _cityController.text, 'geen', _countryController.text, drivers_liscence.toString(), car.toString(), 'Docent');
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      //   //checks if there is no error in the response body.
      //   //if error is not present, navigate the users to Login Screen.
     {
          Navigator.push(
              context,
              MaterialPageRoute(
                //TODO: res.result.rol meegeven aan rol in SkoolWorkshopApp
                  builder: (context) => const SkoolWorkshopApp(rol: "Docent", token: "",)));
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
}