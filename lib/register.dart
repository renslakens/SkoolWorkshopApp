import 'package:flutter/material.dart';
import 'colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  final _nameController = TextEditingController();
  final _sirnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[

            const SizedBox(height:35.0),
            Image.asset('assets/images/Skool-Workshop_Logo.png'),
            
            const SizedBox(height: 60.0),
            TextField(
              controller: _nameController,
              cursorColor: mainColor,
              decoration: InputDecoration(
                labelText: 'Voornaam',
                labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              ),
            ),

            const SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Achternaam',
                labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              ),
            ),

            const SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
              ),
            ),

            const SizedBox(height: 12.0),
            TextField(
              obscureText: !this._showPassword,
              decoration: InputDecoration(
                labelText: 'Wachtwoord',
                labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
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

            const SizedBox(height: 50.0),
            ElevatedButton(
              child: const Text('Terug'),
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
