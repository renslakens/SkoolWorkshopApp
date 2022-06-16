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
  String beschrijving;

  Result({
    required this.naam,
    required this.beschrijving
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    naam: json['naam'] ?? "na",
    beschrijving: json['beschrijving'] ?? "na",
  );

  Map<String, dynamic> toJson() => {
    "naam": naam,
    "beschrijving": beschrijving,
  };
}
