// To parse required this JSON data, do
//
//     final UserModel = userModelFromJson(jsonString);

import 'dart:convert';

customerModel customerModelFromJson(String str) => customerModel.fromJson(json.decode(str));

String customerModelToJson(customerModel data) => json.encode(data.toJson());

class customerModel {
  customerModel({
    required this.status,
    required this.result,
  });

  int status;
  List<Result> result;

  factory customerModel.fromJson(Map<String, dynamic> json) => customerModel(
    status: json["status"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.naam,
    required this.achternaam,
    required this.postcode,
    required this.telefoonnummer,
    required this.straat,
    required this.huisnummer,
    required this.plaats,
    required this.klantType,
    required this.land,
    required this.naamContactpersoon,
  });

  String naam;
  String achternaam;
  String postcode;
  String telefoonnummer;
  String straat;
  String huisnummer;
  String plaats;
  String klantType;
  String land;
  String naamContactpersoon;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    naam: json["naam"],
    achternaam: json["achternaam"],
    postcode: json["postcode"],
    telefoonnummer: json["telefoonnummer"],
    straat: json["straat"],
    huisnummer: json["huisnummer"],
    plaats: json["plaats"],
    klantType: json["klantType"],
    land: json["land"],
    naamContactpersoon: json["naamContactpersoon"],
  );

  Map<String, dynamic> toJson() => {
    "naam": naam,
    "achternaam": achternaam,
    "postcode": postcode,
    "telefoonnummer": telefoonnummer,
    "straat": straat,
    "huisnummer": huisnummer,
    "plaats": plaats,
    "klantType": klantType,
    "land": land,
    "naamContactpersoon": naamContactpersoon,
  };
}
