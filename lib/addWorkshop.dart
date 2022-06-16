import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/Model/workShopDetailModel.dart';
import 'package:skoolworkshop/api_service.dart';

import 'app.dart';
import 'colors.dart';

class AddWorkshopWidget extends StatefulWidget {
  const AddWorkshopWidget({Key? key}) : super(key: key);

  @override
  State<AddWorkshopWidget> createState() => _AddWorkshopWidgetState();
}

class _AddWorkshopWidgetState extends State<AddWorkshopWidget> {
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();

  Future<workshopDetail>? _futureAddWorkshop;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Workshop info", style: Theme.of(context).textTheme.headline2,),
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
              controller: _countryController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
                labelText: 'Beschrijving',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType. multiline,
              maxLines: null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {
              setState(() {
                _handleAddWorkshop();
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

  Future<void> _handleAddWorkshop() async {
    future:
    _futureAddWorkshop;

    workshopDetail res = await apiAddWorkshop(
        context,
        _nameController.text,
        _countryController.text);
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
        content: Text('Error: '),
        backgroundColor: errorColor,
      ));
    }
  }
}

class AddWorkshopPage extends StatelessWidget {
  const AddWorkshopPage({Key? key, required this.rol, required this.emailadres}) : super(key: key);
  final String rol;
  final String emailadres;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text('Workshop toevoegen'),
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
      body: AddWorkshopWidget(),
    );
  }
}

