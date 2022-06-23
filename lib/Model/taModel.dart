class targetAudience {

  int status;
  String message;
  Result result;

  targetAudience({
    required this.status,
    required this.result,
    required this.message
  });


  factory targetAudience.fromJson(Map<String, dynamic> json) => targetAudience(
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
  String doelgroep;

  Result({
    required this.doelgroep,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    doelgroep: json['doelgroep'] ?? "na",
  );

  Map<String, dynamic> toJson() => {
    "doelgroep": doelgroep,
  };
}
