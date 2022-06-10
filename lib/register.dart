import 'dart:convert';
//import 'dart:html';

//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
//import 'package:open_file/open_file.dart';
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
          const SizedBox(
            height: 8,
          ),

          //TODO: File picker naar ander scherm verplaatsen
          //Pick file
          ElevatedButton(onPressed: () async {
            //final result = await FilePicker.platform.pickFiles();
            // if(result == null) return;
            // final file = result.files.first;
            //TODO: File naar api sturen die het in datase zet
            //Blob blob = new Blob(await file.bytes);
          }, child: Icon(Icons.file_upload))
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

  // void openFile(PlatformFile file) {
  //   OpenFile.open(file.path!);
  // }
  //
  // upload(PlatformFile file) async {
  //   // open a bytestream
  //   //var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
  //
  //   // get file length
  //   var length = await file.size;
  //
  //   // string to uri
  //   var uri = Uri.parse("http://ip:8082/composer/predict");
  //
  //   // create multipart request
  //   var request = new http.MultipartRequest("POST", uri);
  //
  //   // multipart that takes file
  //   //var multipartFile = new http.MultipartFile('file', stream, length, filename: basename(file.path));
  //
  //   // add file to multipart
  //   //request.files.add(multipartFile);
  //
  //   // send
  //   var response = await request.send();
  //   print(response.statusCode);
  //
  //   // listen for response
  //   response.stream.transform(utf8.decoder).listen((value) {
  //     print(value);
  //   });
  // }
}

