import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/Model/loginModel.dart';
import 'package:skoolworkshop/api_service.dart';
import 'colors.dart';

class workShopDetail extends StatefulWidget {
  workShopDetail({Key? key}) : super(key: key);

  @override
  State<workShopDetail> createState() => _workshopDetail();
}

class _workshopDetail extends State<workShopDetail> {
  Dio? dio;
  loginModel? _workshop;

  @override
  void initState() {
    super.initState();
    BaseOptions options = BaseOptions(baseUrl: 'https://api.github.com/');
    dio = Dio(options);
    _getData();
  }

  void _getData() async {
    _workshop = (await apiLogin(context, 'niek@gmail.com', '1DIWWeee!!'));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop'),
        backgroundColor: mainColor,
      ),
      body: _workshop == null
          ? const Center(
        child: CircularProgressIndicator(),
      )


          :PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SingleChildScrollView(

              child: Column(children: <Widget>[
              Row(
                //ROW 1
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 25.0, top: 25.0),
                      child: Text(
                        _workshop?.status.toString() ?? 'Naam workshop',
                        style: Theme.of(context).textTheme.bodyText1)
                      )
                ],
              ),
              Row(//ROW 2
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Beschrijving: \n'
                              'Tijdens deze workshop wordt er gewerkt en aandacht gegeven aan de Big 5! Doorzettingsvermogen, Durven, Overwinnen, Respect en Zelfvertrouwen. Jij zorgt ervoor dat deze materialen worden meegenomen: \n\n -Kickbokshandschoenen \n -Stootkussens \n -Trapkussens \n -Pads \n *Geluidsbox mag eventueel ook mee',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),

                          ) //BoxDecor
                      ),

                    )
                  ]),
              Row(//ROW 3
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.schedule),
                                  Text(
                                    'vrijdag 7-9',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),

                          ) //BoxDecor
                      ),

                    )
                  ]),
              Row(//ROW 4
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          margin: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.location_on),
                                  Text(
                                        'Mars',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              )
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),

                          ) //BoxDecor
                      ),

                    )
                  ]),
              Row(//ROW 3
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          margin: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.euro),
                                  Text(
                                    '150 euro',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              )
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),

                          ) //BoxDecor
                      ),

                    )
                  ]),
                ElevatedButton(
                  child: Text('Inschrijven' ,
                      style: Theme.of(context).textTheme.bodyText2),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const RegisterPage()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 50),
                    elevation: 8.0,
                    primary: mainColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                ),
              Row(
                children: <Widget>[
                  SizedBox(height: 20,)
                ],
              ),

              // Row(// ROW 3
              //     children: [
              //       Container(
              //         color: Colors.orange,
              //         margin: EdgeInsets.all(25.0),
              //         child: FlutterLogo(
              //           size: 190.0,
              //         ),
              //       ),
              //     ]),
            ])
            );
          },

      ),


    );
  }
}

