// import 'package:flutter/material.dart';
// import 'model/model.dart';
// import 'api_service.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   late List<UserModel>? _userModel = [];
//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }
//
//   void _getData() async {
//     // _userModel = (await ApiService().getUsers())!;
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('REST API Example'),
//       ),
//       body: _userModel == null || _userModel!.isEmpty
//           ? const Center(
//         child: CircularProgressIndicator(),
//       )
//           : ListView.builder(
//         itemCount: _userModel!.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(_userModel![index].id.toString()),
//                     // Text(_userModel![index].firstName),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     // Text(_userModel![index].email),
//                     // Text(_userModel![index].website),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/Model/loginModel.dart';
import 'package:skoolworkshop/api_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<loginModel>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // _futureAlbum = apiLogin("e@gjfeae.baaae", "D231!ggjr");
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<loginModel> buildFutureBuilder() {
    return FutureBuilder<loginModel>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return Text(snapshot.data!.result.token.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}