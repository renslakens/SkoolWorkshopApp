class locationModel {

  int status;
  Result result;


  int getStatus(){
    return status;
  }

  locationModel({
    required this.status,
    required this.result
  });


  factory locationModel.fromJson(Map<String, dynamic> json) => locationModel(
    status: json['status'] ?? 999, result: Result.fromJson(json['result']));


  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result.toJson(),
  };
}



class Result {
  String naam;
  String land;
  String postcode;
  String straat;
  String huisnummer;
  String plaats;

  Result({
    required this.naam,
    required this.land,
    required this.postcode,
    required this.straat,
    required this.huisnummer,
    required this.plaats,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    naam: json['naam'] ?? "na",
    land: json['land'] ?? "na",
    postcode: json['postcode'] ?? "na",
    straat: json['straat'] ?? "na",
    huisnummer: json['huisnummer'] ?? "na",
    plaats: json['plaats'] ?? "na"
  );

  Map<String, dynamic> toJson() => {
    "naam": naam,
    "land": land,
    "postcode": postcode,
    "straat": straat,
    "huisnummer": huisnummer,
    "plaats": plaats,
  };
}