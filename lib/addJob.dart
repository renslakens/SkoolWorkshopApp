import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:multiselect/multiselect.dart';
import 'apis.dart';

import 'package:numberpicker/numberpicker.dart';

import 'app.dart';
import 'colors.dart';

class AddJobWidget extends StatefulWidget {
  const AddJobWidget({Key? key}) : super(key: key);

  @override
  State<AddJobWidget> createState() => _AddJobWidgetState();
}

// class MultiSelect extends StatefulWidget {
//   final List<String> items;
//   const MultiSelect({Key? key, required this.items}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _MultiSelectState();
// }

// class _MultiSelectState extends State<MultiSelect> {
//   // this variable holds the selected items
//   final List<String> _selectedItems = [];
//
// // This function is triggered when a checkbox is checked or unchecked
//   void _itemChange(String itemValue, bool isSelected) {
//     setState(() {
//       if (isSelected) {
//         _selectedItems.add(itemValue);
//       } else {
//         _selectedItems.remove(itemValue);
//       }
//     });
//   }
//
//   // this function is called when the Cancel button is pressed
//   void _cancel() {
//     Navigator.pop(context);
//   }
//
// // this function is called when the Submit button is tapped
//   void _submit() {
//     Navigator.pop(context, _selectedItems);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Select Topics'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: widget.items
//               .map((item) => CheckboxListTile(
//             value: _selectedItems.contains(item),
//             title: Text(item),
//             controlAffinity: ListTileControlAffinity.leading,
//             onChanged: (isChecked) => _itemChange(item, isChecked!),
//           ))
//               .toList(),
//         ),
//       ),
//       actions: [
//         TextButton(
//           child: const Text('Cancel'),
//           onPressed: _cancel,
//         ),
//         ElevatedButton(
//           child: const Text('Submit'),
//           onPressed: _submit,
//         ),
//       ],
//     );
//   }
// }
class _AddJobWidgetState extends State<AddJobWidget> {
  final _numberofteachersController = TextEditingController();
  final _salaryController = TextEditingController();
  final _starttimeController = TextEditingController();
  final _endtimeController = TextEditingController();
  final _locationController = TextEditingController();
  final _workshopController = TextEditingController();
  final _customerController = TextEditingController();

  List<String> doelgroepen = ['BSO', 'Primaire Onderwijs','Voortgezet Onderwijs', 'MBO', 'HBO', 'Kinderfeestje', 'Vrijgezellenfeest', 'Bedrijfsuitje/Teambuilding', 'Speciaal Onderwijs'];
  final String taUrl = apis.baseUrl + apis.taRoute;
  int _currentValue = 0;


  Future<List<dynamic>> fetchDoelgroepen() async {
    var result = await http.get(Uri.parse(taUrl));
    return json.decode(result.body)['result'];
  }

  String _doelgroep(dynamic doelgroep) {
    return _doelgroep('doelgroep');
  }

  int _doelgroepID(dynamic doelgroep) {
    return _doelgroepID('doelgroepID');
  }

  Future<void> addToList(String _doelgroep, int _doelgroepID) async {
    doelgroepen.add(_doelgroep);
  }

  List<String> selected = [];

  // void _showMultiSelect() async {
  //   // a list of selectable items
  //   // these items can be hard-coded or dynamically fetched from a database/API
  //   final List<String> _items = [
  //     'Flutter',
  //     'Node.js',
  //     'React Native',
  //     'Java',
  //     'Docker',
  //     'MySQL'
  //   ];
  //
  //   final List<String>? results = await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return MultiSelect(items: _items);
  //     },
  //   );
  //
  //   // Update UI
  //   if (results != null) {
  //     setState(() {
  //       _selectedItems = results;
  //     });
  //   }
  // }

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
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
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
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
                labelText: 'Kies starttijd',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  // theme: ThemeData(primarySwatch: Colors.pink),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  helpText: 'Selecteer starttijd',
                  cancelText: 'Annuleer',
                  confirmText: 'Bevestig',
                );
                _starttimeController.text = date.toString().substring(0, 10);
              },
            ),
            TextField(
              controller: _endtimeController,
              readOnly: true,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
                labelText: 'Kies eindtijd',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  // theme: ThemeData(primarySwatch: Colors.pink),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  helpText: 'Selecteer eindtijd',
                  cancelText: 'Annuleer',
                  confirmText: 'Bevestig',
                );
                _endtimeController.text = date.toString().substring(0, 10);
              },
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
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
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
                labelText: 'Workshop',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: _customerController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
                labelText: 'Klant',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
            ),

            DropDownMultiSelect(
              onChanged: (List<String> x) {
                setState(() {
                  selected =x;
                });
              },
              options: doelgroepen,
              selectedValues: selected,
              whenEmpty: 'Selecteer doelgroepen',
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
              ),
            ),


            // MultiSelectDialogField(
            //   items: _doelgroepen.map((e) => MultiSelectItem(e, e)).toList(),
            //   listType: MultiSelectListType.CHIP,
            //   onConfirm: (values) {
            //     _doelgroepen = values;
            //   },
            // ),
            // AlertDialog(
            //   title: const Text('Select Topics'),
            //   content: SingleChildScrollView(
            //     child: ListBody(
            //       children: widget.items
            //           .map((item) => CheckboxListTile(
            //                 value: _selectedItems.contains(item),
            //                 title: Text(item),
            //                 controlAffinity: ListTileControlAffinity.leading,
            //                 onChanged: (isChecked) =>
            //                     _itemChange(item, isChecked!),
            //               ))
            //           .toList(),
            //     ),
            //   ),
            //   actions: [
            //     TextButton(
            //       child: const Text('Cancel'),
            //       onPressed: _cancel,
            //     ),
            //     ElevatedButton(
            //       child: const Text('Submit'),
            //       onPressed: _submit,
            //     ),
            //   ],
            // ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Toevoegen",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddJobPage extends StatelessWidget {
  const AddJobPage(
      {Key? key,
      required this.rol,
      required this.emailadres,
      required this.voornaam})
      : super(key: key);
  final String rol;
  final String emailadres;
  final String voornaam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text('Opdracht toevoegen'),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) =>
                      SkoolWorkshopApp(
                    rol: rol,
                    emailadres: emailadres,
                    voornaam: voornaam,
                  ),
                ),
              );
            },
          ),
          backgroundColor: mainColor),
      body: AddJobWidget(),
    );
  }
}
