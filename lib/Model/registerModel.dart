class registerModel {

  int status;
  Result result;
  String message;
  // final String naam;
  // final String achternaam;
  // final String emailadres;
  // final String wachtwoord;


  int getStatus(){
    return status;
  }

  registerModel({
    required this.status,
    required this.result,
    required this.message
  });


  factory registerModel.fromJson(Map<String, dynamic> json) => registerModel(
    status: json['status'] ?? 999,
      result: Result.fromJson(json["result"]),
    message: json['message'] ?? "na");


  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result.toJson(),
    "message": message,
  };
}



class Result {
  String token;
  String rol;
  int isAccepted;

  Result({
    required this.token,
    required this.rol,
    required this.isAccepted,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    token: json['token'] ?? "na",
    rol: json['rol'] ?? "",
    isAccepted: json['isAccepted'] ?? 99,
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "rol": rol,
    "isAccepted": isAccepted,
  };
}


// class Result{
//   String token;
//
//   Result({
//     required this.token
// });
//
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     token: json["token"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "token": token,
//   };
// }