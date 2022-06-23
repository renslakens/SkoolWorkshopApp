class opdrachtGetModel {

  int status;
  Result result;

  opdrachtGetModel({
    required this.status,
    required this.result
  });


  factory opdrachtGetModel.fromJson(Map<String, dynamic> json) => opdrachtGetModel(
    status: json['status'] ?? "na",
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result.toJson(),
  };
}



class Result {
  String workshopnaam;
  String beschrijving;
  int aantalDocenten;
  DateTime startTijd;
  DateTime eindTijd;
  String naam;
  String land;
  String postcode;
  String straat;
  String huisnummer;
  String plaats;
  int locatieID;
  int workshopID;
  int klantID;
  int doelgroepID;

  Result({
    required this.workshopnaam,
    required this.beschrijving,
    required this.aantalDocenten,
    required this.startTijd,
    required this.eindTijd,
    required this.naam,
    required this.land,
    required this.postcode,
    required this.straat,
    required this.huisnummer,
    required this.plaats,
    required this.locatieID,
    required this.workshopID,
    required this.klantID,
    required this.doelgroepID,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    workshopnaam: json['workshopnaam'] ?? 'na',
    beschrijving: json['beschrijving'] ?? 'na',
    aantalDocenten: json['aantalDocenten'] ?? 0,
    startTijd: json['startTijd'],
    eindTijd: json['eindTijd'],
    naam: json['naam'] ?? 'na',
    land: json['land'] ?? 'na',
    postcode: json['postcode'] ?? '1234AB',
    straat: json['straat'] ?? 'na',
    huisnummer: json['huisnummer'] ?? 0,
    plaats: json['plaats'] ?? 'na',
    locatieID: json['locatieID'] ?? 0,
    workshopID: json['workshopID'] ?? 0,
    klantID: json['klantID'] ?? 0,
    doelgroepID: json['doelgroepID'] ?? 0,

  );

  Map<String, dynamic> toJson() => {
    "workshopnaam": workshopnaam,
    "beschrijving": beschrijving,
    "aantalDocenten": aantalDocenten,
    "startTijd": startTijd,
    "eindTijd": eindTijd,
    "naam": naam,
    "land": land,
    "postcode": postcode,
    "straat": straat,
    "huisnummer": huisnummer,
    "plaats": plaats,
    "locatieID": locatieID,
    "workshopID": workshopID,
    "klantID": klantID,
    "doelgroepID": doelgroepID,
  };
}
