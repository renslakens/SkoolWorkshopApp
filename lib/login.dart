import 'package:flutter/material.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: Colors.black,
                  ),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),


                )),
            const SizedBox(height: 12.0),
            TextField(
              obscureText: !this._showPassword,
              cursorColor: mainColor,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
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
              child: const Text('Log in'),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                primary: mainColor,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Registreer'),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                primary: mainColor,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
