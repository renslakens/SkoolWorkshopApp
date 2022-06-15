class opdrachtModel {

  int status;
  String message;
  Result result;

  opdrachtModel({
    required this.status,
    required this.result,
    required this.message
  });


  factory opdrachtModel.fromJson(Map<String, dynamic> json) => opdrachtModel(
    status: json['status'] ?? "na",
    message: json['message'] ?? "na",
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
  };
}



class Result {
  String aantalDocenten;
  int salarisIndicatie;
  DateTime startTijd;
  DateTime eindTijd;
  int locatieID;
  int workshopID;


  Result({
    required this.aantalDocenten,
    required this.salarisIndicatie,
    required this.startTijd,
    required this.eindTijd,
    required this.locatieID,
    required this.workshopID,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    aantalDocenten: json['aantalDocenten'] ?? 0,
    salarisIndicatie: json['salarisIndicatie'] ?? 0,
    startTijd: json['startTijd'],
    eindTijd: json['eindTijd'],
    locatieID: json['locatieID'],
    workshopID: json['workshopID'],

  );

  Map<String, dynamic> toJson() => {
    "aantalDocenten": aantalDocenten,
    "salarisIndicatie": salarisIndicatie,
    "startTijd": startTijd,
    "eindTijd": eindTijd,
    "locatieID": locatieID,
    "workshopID": workshopID,
  };
}
