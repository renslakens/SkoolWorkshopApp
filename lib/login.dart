import 'package:flutter/material.dart';
import 'Model/loginModel.dart';
import 'api_service.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  Future<loginModel>? _futureLogin;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                //TODO: image hier plaatsen
                const SizedBox(height: 16.0),
                Image.asset('assets/images/Skool-Workshop_Logo.png'),
                // Text(
                //   'SHRINE',
                //   style: Theme.of(context).textTheme.headline5,
                // ),
              ],
            ),
            const SizedBox(height: 120.0),
            TextField(
                controller: _usernameController,
                cursorColor: mainColor,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontFamily: 'Heebo',
                      color: Colors.black,
                  ),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),


                )),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              obscureText: !this._showPassword,
              cursorColor: mainColor,
              decoration: InputDecoration(
                labelText: 'Wachtwoord',
                labelStyle: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.black,
                ),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),

                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: this._showPassword ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() => this._showPassword = !this._showPassword);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 50, // <-- SEE HERE
            ),
            ElevatedButton(
              child: const Text('Log in',
              style: TextStyle(fontFamily: 'Heebo')),
              onPressed: () {
                // Navigator.pop(context);
                _futureLogin = apiLogin(_usernameController.text.toString(), _passwordController.text.toString());
                print("loginDetails: " + _usernameController.text + ', ' + _passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                primary: mainColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Registreer',
                  style: TextStyle(fontFamily: 'Heebo')),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                primary: mainColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
