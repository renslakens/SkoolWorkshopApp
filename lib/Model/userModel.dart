// To parse required this JSON data, do
//
// final UserModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.docentId,
    required this.naam,
    required this.achternaam,
    required this.emailadres,
    required this.geboortedatum,
    required this.geboorteplaats,
    this.maxRijafstand,
    this.heeftRijbewijs,
    this.heeftAuto,
    required this.straat,
    required this.huisnummer,
    required this.geslacht,
    required this.nationaliteit,
    required this.woonplaats,
    required this.postcode,
    required this.land,
    required this.wachtwoord,
    required this.isAccepted,
    this.isFlexwerker,
  });
  int docentId;
  String naam;
  String achternaam;
  String emailadres;
  DateTime geboortedatum;
  String geboorteplaats;
  dynamic maxRijafstand;
  dynamic heeftRijbewijs;
  dynamic heeftAuto;
  String straat;
  int huisnummer;
  String geslacht;
  String nationaliteit;
  String woonplaats;
  String postcode;
  String land;
  String wachtwoord;
  int isAccepted;
  dynamic isFlexwerker;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        docentId: json["docentID"],
        naam: json["naam"],
        achternaam: json["achternaam"],
        emailadres: json["emailadres"],
        geboortedatum: DateTime.parse(json["geboortedatum"]),
        geboorteplaats: json["geboorteplaats"],
        maxRijafstand: json["maxRijafstand"],
        heeftRijbewijs: json["heeftRijbewijs"],
        heeftAuto: json["heeftAuto"],
        straat: json["straat"],
        huisnummer: json["huisnummer"],
        geslacht: json["geslacht"],
        nationaliteit: json["nationaliteit"],
        woonplaats: json["woonplaats"],
        postcode: json["postcode"],
        land: json["land"],
        wachtwoord: json["wachtwoord"],
        isAccepted: json["isAccepted"],
        isFlexwerker: json["isFlexwerker"],
      );

  Map<String, dynamic> toJson() => {
        "docentID": docentId,
        "naam": naam,
        "achternaam": achternaam,
        "emailadres": emailadres,
        "geboortedatum": geboortedatum.toIso8601String(),
        "geboorteplaats": geboorteplaats,
        "maxRijafstand": maxRijafstand,
        "heeftRijbewijs": heeftRijbewijs,
        "heeftAuto": heeftAuto,
        "straat": straat,
        "huisnummer": huisnummer,
        "geslacht": geslacht,
        "nationaliteit": nationaliteit,
        "woonplaats": woonplaats,
        "postcode": postcode,
        "land": land,
        "wachtwoord": wachtwoord,
        "isAccepted": isAccepted,
        "isFlexwerker": isFlexwerker,
      };
}
