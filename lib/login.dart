import 'package:flutter/material.dart';
import 'package:skoolworkshop/register.dart';
import 'Model/loginModel.dart';
import 'api_service.dart';
import 'app.dart';
import 'awaitingProfile.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  Future<loginModel>? _futureLogin;
  final _emailController = TextEditingController();
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
                controller: _emailController,
                cursorColor: mainColor,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: const BorderSide(color: mainColor)),
                )),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              obscureText: !this._showPassword,
              cursorColor: mainColor,
              decoration: InputDecoration(
                labelText: 'Wachtwoord',
                labelStyle: Theme.of(context).textTheme.bodyText1,
                focusedBorder: const UnderlineInputBorder(
                    borderSide: const BorderSide(color: mainColor)),
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
              onPressed: () {
                _handleRegister();
                // Navigator.pop(context);
                // _futureLogin = apiLogin(_usernameController.text.toString(), _passwordController.text.toString());
                // print("loginDetails: " + _usernameController.text + ', ' + _passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                primary: mainColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
              child:
                  Text('Log in', style: Theme.of(context).textTheme.bodyText2),
            ),
            ElevatedButton(
              child: Text('Registreer',
                  style: Theme.of(context).textTheme.bodyText2),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage(rol: "",)),
                );
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

  Future<void> _handleRegister() async {

    if (!(_emailController.text.toString().contains("@"))) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldige email'),
        backgroundColor: errorColor,
      ));
    } else if (!(_passwordController.text.length > 7)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ongeldig wachtwoord'),
        backgroundColor: errorColor,
      ));
    } else {

      future:
      _futureLogin;
      loginModel res = await apiLogin(
          context, _emailController.text, _passwordController.text);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      print("token: " + res.result.token);
      print("rol: " + res.result.rol);
      print("voornaam: " + res.result.voornaam);
      String rol = res.result.rol;
      String emailadres = res.result.emailadres;
      String voornaam = res.result.voornaam;

      //   //checks if there is no error in the response body.
      //   //if error is not present, navigate the users to Login Screen.
      if (res.result.token != null) {
        if (res.result.isAccepted == 0) {
          // Navigator.pushReplacementNamed(context, '/awaiting');
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => awaitingProfile()
            ),
          );
        } else {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => SkoolWorkshopApp(
                rol: rol, emailadres: emailadres, voornaam: voornaam,
              ),
            ),
          );
        }
      } else {
        //if error is present, display a snackbar showing the error messsage
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error: '),
          backgroundColor: errorColor,
        ));
      }
    }
  }
}
