class workshopDetail {

  int status;
  String message;
  Result result;

  workshopDetail({
    required this.status,
    required this.result,
    required this.message
  });


  factory workshopDetail.fromJson(Map<String, dynamic> json) => workshopDetail(
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
  String naam;
  DateTime startTijd;
  DateTime eindTijd;
  String beschrijving;


  Result({
    required this.naam,
    required this.startTijd,
    required this.eindTijd,
    required this.beschrijving
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    naam: json['naam'] ?? "na",
    startTijd: json['startTijd'] ?? "na",
    eindTijd: json['eindTijd'] ?? "na",
    beschrijving: json['beschrijving'] ?? "na",
  );

  Map<String, dynamic> toJson() => {
    "naam": naam,
    "startTijd": startTijd,
    "eindTijd": eindTijd,
    "beschrijving": beschrijving,
  };
}
