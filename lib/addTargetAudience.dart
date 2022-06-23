import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/Model/taModel.dart';
import 'package:skoolworkshop/Model/workShopDetailModel.dart';
import 'package:skoolworkshop/api_service.dart';

import 'app.dart';
import 'colors.dart';

class AddTAWidget extends StatefulWidget {
  const AddTAWidget({Key? key}) : super(key: key);

  @override
  State<AddTAWidget> createState() => _AddTAWidgetState();
}

class _AddTAWidgetState extends State<AddTAWidget> {
  final _doelgroepController = TextEditingController();

  Future<targetAudience>? _futureAddTargetAudience;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Doelgroep info", style: Theme.of(context).textTheme.headline2,),
            TextField(
              controller: _doelgroepController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                labelText: 'Doelgroep',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {
              setState(() {
                _handleAddTargetAudience();
              });
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

  Future<void> _handleAddTargetAudience() async {
    future:
    _futureAddTargetAudience;


    if(_doelgroepController.text.isEmpty){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Vul een doelgroep in'),
        backgroundColor: errorColor,
      ));
    } else {
      targetAudience res = await apiAddTargetAudience(
          context,
          _doelgroepController.text);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res.status == 201) {
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
            content: Text('Doelgroep is toegevoegd '),
            backgroundColor: green,
          ));
        }
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Doelgroep is niet toegevoegd'),
          backgroundColor: errorColor,
        ));
      }
    }
  }
}

class AddTAPage extends StatelessWidget {
  const AddTAPage({Key? key, required this.rol, required this.emailadres, required this.voornaam}) : super(key: key);
  final String rol;
  final String emailadres;
  final String voornaam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text('Doelgroep toevoegen'),
          leading: GestureDetector(
            child: Icon( Icons.arrow_back,),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) => SkoolWorkshopApp(
                    rol: rol, emailadres: emailadres, voornaam: voornaam,
                  ),
                ),
              );
            } ,
          ),
          backgroundColor: mainColor
      ),
      body: AddTAWidget(),
    );
  }
}

