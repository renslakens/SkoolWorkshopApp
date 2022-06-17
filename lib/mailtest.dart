import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

mailtest() async {
  String username = 'rens@lakens.org';
  String password = 'L@k3n504';

  final smtpServer = SmtpServer(
    'mail.lakens.org',
    port: 587,
    ssl: false,
    xoauth2Token: "L@k3n504",
    username: username,
    password: password
  );

  // Create our message.
  final message = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add('r.lakens@student.avans.nl')
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Messaentge not s.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}

class Mail extends StatefulWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");

  // bool verify() {
  //   print(emailAuth.validateOtp(
  //       recipientMail: _emailController.value.text,
  //       userOtp: _otpController.value.text));
  // }

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 5);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mailtest"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextField(
            //   controller: _emailController,
            // ),
            // TextField(
            //   controller: _otpController,
            // ),
            // ElevatedButton(onPressed: sendOtp, child: Text("Send OTP"))
            ElevatedButton(onPressed: mailtest, child: Text("Send mail"))
          ],
        ),
      ),
    );
  }
}
