import 'package:email_auth/email_auth.dart';
import 'package:enough_mail/codecs.dart';
import 'package:enough_mail/discover.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

String username = 'skool2022-2@concor.nl';
String password = 'Skool2022-2!';

final smtpServer = SmtpServer(
    'smtp.ionos.co.uk',
    port: 587,
    ssl: false,
    ignoreBadCertificate: false,
    allowInsecure: false,
    username: username,
    password: password
);

acountregistered(String recipient, String naam) async {

  String? html = '''<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml">

<head>
    <title></title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <!--[if mso]><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch><o:AllowPNG/></o:OfficeDocumentSettings></xml><![endif]-->
    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            margin: 0;
            padding: 0;
        }
        
        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: inherit !important;
        }
        
        #MessageViewBody a {
            color: inherit;
            text-decoration: none;
        }
        
        p {
            line-height: inherit
        }
        
        .desktop_hide,
        .desktop_hide table {
            mso-hide: all;
            display: none;
            max-height: 0px;
            overflow: hidden;
        }
        
        @media (max-width:920px) {
            .desktop_hide table.icons-inner {
                display: inline-block !important;
            }
            .icons-inner {
                text-align: center;
            }
            .icons-inner td {
                margin: 0 auto;
            }
            .row-content {
                width: 100% !important;
            }
            .column .border,
            .mobile_hide {
                display: none;
            }
            table {
                table-layout: fixed !important;
            }
            .stack .column {
                width: 100%;
                display: block;
            }
            .mobile_hide {
                min-height: 0;
                max-height: 0;
                max-width: 0;
                overflow: hidden;
                font-size: 0px;
            }
            .desktop_hide,
            .desktop_hide table {
                display: table !important;
                max-height: none !important;
            }
        }
    </style>
</head>

<body style="background-color: #FFFFFF; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;">
    <table border="0" cellpadding="0" cellspacing="0" class="nl-container" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF;" width="100%">
        <tbody>
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-1" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                        <tbody>
                            <tr>
                                <td>
                                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="row-content" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000; width: 900px;" width="900">
                                        <tbody>
                                            <tr>
                                                <td class="column column-1" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 5px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                    width="100%">
                                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="color:#000000;direction:ltr;font-family:Arial, Helvetica Neue, Helvetica, sans-serif;font-size:14px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:left;">
                                                                    <p style="margin: 0;">Beste {{NAAM}},<br/><br/>Leuk dat je een account heb aangemaakt voor Skool Workshop!<br/><br/>Jouw account wordt zo spoedig mogelijk gecontroleerd door één van onze medewerkers. Je krijgt
                                                                        een mailtje zodra dit gedaan is.<br/><br/><strong>Team Skool Workshop</strong></p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table border="0" cellpadding="10" cellspacing="0" class="image_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="line-height:10px"><img src="https://i.ibb.co/WHZwxf9/Skool-Workshop-Logo.png" /></div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="color:#000000;direction:ltr;font-family:Arial, Helvetica Neue, Helvetica, sans-serif;font-size:14px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:left;">
                                                                    <p style="margin: 0;">Telefoon: +31 (0)85 - 065 39 23<br/>Whatsapp: +31 (0)6 - 28 31 88 42<br/>E-mail: <a href="mailto:info@skoolworkshop.nl" rel="noopener" style="text-decoration: underline; color: #0068a5;"
                                                                            target="_blank">info@skoolworkshop.nl</a><br/>Website: <a href="https://www.skoolworkshop.nl" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.skoolworkshop.nl</a><br/><br/>Volg
                                                                        ons via:<br/><a href="https://www.facebook.com/skoolworkshop" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.facebook.com/skoolworkshop</a><br/>
                                                                        <a href="https://www.twitter.com/skoolworkshop" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.twitter.com/skoolworkshop</a>
                                                                    </p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <!-- End -->
</body>

</html>''';

  // Create our message.
  final message = Message()
    ..from = Address(username, 'Skool Workshop')
    ..recipients.add(recipient)
    ..subject = 'Jouw account is in afwachting op goedkeuring!'
    ..html = html.replaceAll('{{NAAM}}', naam);

  var connection = PersistentConnection(smtpServer);

  // Send the first message
  await connection.send(message);

  // close the connection
  await connection.close();
}

accountaccepted(String recipient, String naam) async {

  String? html = '''<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml">

<head>
    <title></title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <!--[if mso]><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch><o:AllowPNG/></o:OfficeDocumentSettings></xml><![endif]-->
    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            margin: 0;
            padding: 0;
        }
        
        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: inherit !important;
        }
        
        #MessageViewBody a {
            color: inherit;
            text-decoration: none;
        }
        
        p {
            line-height: inherit
        }
        
        .desktop_hide,
        .desktop_hide table {
            mso-hide: all;
            display: none;
            max-height: 0px;
            overflow: hidden;
        }
        
        @media (max-width:920px) {
            .desktop_hide table.icons-inner {
                display: inline-block !important;
            }
            .icons-inner {
                text-align: center;
            }
            .icons-inner td {
                margin: 0 auto;
            }
            .row-content {
                width: 100% !important;
            }
            .column .border,
            .mobile_hide {
                display: none;
            }
            table {
                table-layout: fixed !important;
            }
            .stack .column {
                width: 100%;
                display: block;
            }
            .mobile_hide {
                min-height: 0;
                max-height: 0;
                max-width: 0;
                overflow: hidden;
                font-size: 0px;
            }
            .desktop_hide,
            .desktop_hide table {
                display: table !important;
                max-height: none !important;
            }
        }
    </style>
</head>

<body style="background-color: #FFFFFF; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;">
    <table border="0" cellpadding="0" cellspacing="0" class="nl-container" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF;" width="100%">
        <tbody>
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-1" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                        <tbody>
                            <tr>
                                <td>
                                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="row-content" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000; width: 900px;" width="900">
                                        <tbody>
                                            <tr>
                                                <td class="column column-1" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 5px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                    width="100%">
                                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="color:#000000;direction:ltr;font-family:Arial, Helvetica Neue, Helvetica, sans-serif;font-size:14px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:left;">
                                                                    <p style="margin: 0;">Beste {{NAAM}},<br/><br/>Wij hebben goed nieuws!<br/><br/>Jouw account is goedgekeurd en je kunt nu inloggen in de app met jouw inloggegevens.<br/><br/>Veel succes met het geven van jouw
                                                                        workshops!
                                                                        <br/><br/><strong>Team Skool Workshop</strong></p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table border="0" cellpadding="10" cellspacing="0" class="image_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="line-height:10px"><img src="https://i.ibb.co/WHZwxf9/Skool-Workshop-Logo.png" /></div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="color:#000000;direction:ltr;font-family:Arial, Helvetica Neue, Helvetica, sans-serif;font-size:14px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:left;">
                                                                    <p style="margin: 0;">Telefoon: +31 (0)85 - 065 39 23<br/>Whatsapp: +31 (0)6 - 28 31 88 42<br/>E-mail: <a href="mailto:info@skoolworkshop.nl" rel="noopener" style="text-decoration: underline; color: #0068a5;"
                                                                            target="_blank">info@skoolworkshop.nl</a><br/>Website: <a href="https://www.skoolworkshop.nl" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.skoolworkshop.nl</a><br/><br/>Volg
                                                                        ons via:<br/><a href="https://www.facebook.com/skoolworkshop" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.facebook.com/skoolworkshop</a><br/>
                                                                        <a href="https://www.twitter.com/skoolworkshop" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.twitter.com/skoolworkshop</a>
                                                                    </p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <!-- End -->
</body>

</html>''';

  // Create our message.
  final message = Message()
    ..from = Address(username, 'Skool Workshop')
    ..recipients.add(recipient)
    ..subject = 'Jouw account is goedgekeurd!'
    ..html = html.replaceAll("{{NAAM}}", naam);

  var connection = PersistentConnection(smtpServer);

  // Send the first message
  await connection.send(message);

  // close the connection
  await connection.close();
}

accountdeleted(String recipient, String naam) async {

  String? html = '''<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml">

<head>
    <title></title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <!--[if mso]><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch><o:AllowPNG/></o:OfficeDocumentSettings></xml><![endif]-->
    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            margin: 0;
            padding: 0;
        }
        
        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: inherit !important;
        }
        
        #MessageViewBody a {
            color: inherit;
            text-decoration: none;
        }
        
        p {
            line-height: inherit
        }
        
        .desktop_hide,
        .desktop_hide table {
            mso-hide: all;
            display: none;
            max-height: 0px;
            overflow: hidden;
        }
        
        @media (max-width:920px) {
            .desktop_hide table.icons-inner {
                display: inline-block !important;
            }
            .icons-inner {
                text-align: center;
            }
            .icons-inner td {
                margin: 0 auto;
            }
            .row-content {
                width: 100% !important;
            }
            .column .border,
            .mobile_hide {
                display: none;
            }
            table {
                table-layout: fixed !important;
            }
            .stack .column {
                width: 100%;
                display: block;
            }
            .mobile_hide {
                min-height: 0;
                max-height: 0;
                max-width: 0;
                overflow: hidden;
                font-size: 0px;
            }
            .desktop_hide,
            .desktop_hide table {
                display: table !important;
                max-height: none !important;
            }
        }
    </style>
</head>

<body style="background-color: #FFFFFF; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;">
    <table border="0" cellpadding="0" cellspacing="0" class="nl-container" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF;" width="100%">
        <tbody>
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-1" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                        <tbody>
                            <tr>
                                <td>
                                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="row-content" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000; width: 900px;" width="900">
                                        <tbody>
                                            <tr>
                                                <td class="column column-1" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 5px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                    width="100%">
                                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="color:#000000;direction:ltr;font-family:Arial, Helvetica Neue, Helvetica, sans-serif;font-size:14px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:left;">
                                                                    <p style="margin: 0;">Beste {{NAAM}},<br/><br/>Jouw account is verwijderd.<br/><br/>Reden: {{REDEN}}<br/><br/><strong>Team Skool Workshop</strong></p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table border="0" cellpadding="10" cellspacing="0" class="image_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="line-height:10px"><img src="https://i.ibb.co/WHZwxf9/Skool-Workshop-Logo.png" /></div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div style="color:#000000;direction:ltr;font-family:Arial, Helvetica Neue, Helvetica, sans-serif;font-size:14px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:left;">
                                                                    <p style="margin: 0;">Telefoon: +31 (0)85 - 065 39 23<br/>Whatsapp: +31 (0)6 - 28 31 88 42<br/>E-mail: <a href="mailto:info@skoolworkshop.nl" rel="noopener" style="text-decoration: underline; color: #0068a5;"
                                                                            target="_blank">info@skoolworkshop.nl</a><br/>Website: <a href="https://www.skoolworkshop.nl" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.skoolworkshop.nl</a><br/><br/>Volg
                                                                        ons via:<br/><a href="https://www.facebook.com/skoolworkshop" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.facebook.com/skoolworkshop</a><br/>
                                                                        <a href="https://www.twitter.com/skoolworkshop" rel="noopener" style="text-decoration: underline; color: #0068a5;" target="_blank">www.twitter.com/skoolworkshop</a>
                                                                    </p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <!-- End -->
</body>

</html>''';

  // Create our message.
  final message = Message()
    ..from = Address(username, 'Skool Workshop')
    ..recipients.add(recipient)
    ..subject = 'Jouw account is verwijderd'
    ..html = html.replaceAll("{{NAAM}}", naam).replaceAll("{{REDEN}}", "-");

  var connection = PersistentConnection(smtpServer);

  // Send the first message
  await connection.send(message);

  // close the connection
  await connection.close();
}

// class Mail extends StatefulWidget {
//   const Mail({Key? key}) : super(key: key);
//
//   @override
//   State<Mail> createState() => _MailState();
// }
//
// class _MailState extends State<Mail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mailtest"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(onPressed: acountregistered(), child: Text("Send mail"))
//           ],
//         ),
//       ),
//     );
//   }
// }
