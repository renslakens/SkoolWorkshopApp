import 'package:flutter/material.dart';
import 'colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  int _activeCurrentStep = 0;
  // bool _showPassword = false;
  final _nameController = TextEditingController();
  // final _sirnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _pincodeController = TextEditingController();

List<Step> stepList() => [
  Step(
    state: _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
    isActive: _activeCurrentStep >= 0,
    title: const Text('Inloggegevens'),
    content: Container(
      child: Column(
        children: [

          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          const SizedBox(
          height: 8,
          ),

          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
          height: 8,
          ),

          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ],
      ),
    )),

  Step(
    state:_activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
    isActive: _activeCurrentStep >= 1,
    title: const Text('Address'),
    content: Container(
      child: Column(
        children: [
          const SizedBox(
          height: 8,
          ),

          TextField(
            controller: _addressController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full House Address',
           ),
         ),
          const SizedBox(
            height: 8,
          ),

        TextField(
         controller: _pincodeController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pin Code',
          ),
        ),
      ],
    ),
  )),

  Step(
      state: StepState.complete,
      isActive: _activeCurrentStep >= 2,
      title: const Text('Confirm'),
      content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Name: ${_nameController.text}'),
              Text('Email: ${_emailController.text}'),
              Text('Password: ${_passwordController.text}'),
              Text('Address : ${_addressController.text}'),
              Text('PinCode : ${_pincodeController.text}'),
            ],
          )))
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registratie'),
      ),
      body: Stepper(
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
