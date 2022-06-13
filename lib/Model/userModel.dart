// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class UserModel {
  UserModel({
    required this.status,
    required this.result,
  });

  int status;
  List result;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        status: json["status"] == null ? null : json["status"],
        result: json["result"]
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status == null ? null : status,
        "result": result == null ? null : List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {

  Result userModelFromJson(String str) => Result.fromJson(json.decode(str));
  String userModelToJson(UserModel data) => json.encode(data.toJson());

  Result({
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
  String geboortedatum;
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

  factory Result.fromJson(Map<String, dynamic> json) =>
      Result(
        docentId: json["docentID"] == null ? null : json["docentID"],
        naam: json["naam"] == null ? null : json["naam"],
        achternaam: json["achternaam"] == null ? null : json["achternaam"],
        emailadres: json["emailadres"] == null ? null : json["emailadres"],
        geboortedatum: json["geboortedatum"] == null ? null : (json["geboortedatum"]),
        geboorteplaats: json["geboorteplaats"] == null
            ? null
            : json["geboorteplaats"],
        maxRijafstand: json["maxRijafstand"],
        heeftRijbewijs: json["heeftRijbewijs"],
        heeftAuto: json["heeftAuto"],
        straat: json["straat"] == null ? null : json["straat"],
        huisnummer: json["huisnummer"] == null ? null : json["huisnummer"],
        geslacht: json["geslacht"] == null ? null : json["geslacht"],
        nationaliteit: json["nationaliteit"] == null
            ? null
            : json["nationaliteit"],
        woonplaats: json["woonplaats"] == null ? null : json["woonplaats"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        land: json["land"] == null ? null : json["land"],
        wachtwoord: json["wachtwoord"] == null ? null : json["wachtwoord"],
        isAccepted: json["isAccepted"] == null ? null : json["isAccepted"],
        isFlexwerker: json["isFlexwerker"],
      );

  Map<String, dynamic> toJson() =>
      {
        "docentID": docentId == null ? null : docentId,
        "naam": naam == null ? null : naam,
        "achternaam": achternaam == null ? null : achternaam,
        "emailadres": emailadres == null ? null : emailadres,
        "geboortedatum": geboortedatum == null ? null : geboortedatum,
        "geboorteplaats": geboorteplaats == null ? null : geboorteplaats,
        "maxRijafstand": maxRijafstand,
        "heeftRijbewijs": heeftRijbewijs,
        "heeftAuto": heeftAuto,
        "straat": straat == null ? null : straat,
        "huisnummer": huisnummer == null ? null : huisnummer,
        "geslacht": geslacht == null ? null : geslacht,
        "nationaliteit": nationaliteit == null ? null : nationaliteit,
        "woonplaats": woonplaats == null ? null : woonplaats,
        "postcode": postcode == null ? null : postcode,
        "land": land == null ? null : land,
        "wachtwoord": wachtwoord == null ? null : wachtwoord,
        "isAccepted": isAccepted == null ? null : isAccepted,
        "isFlexwerker": isFlexwerker,
      };
}
