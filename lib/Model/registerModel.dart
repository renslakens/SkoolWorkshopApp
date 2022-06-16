class registerModel {

  int status;
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
    required this.message
  });


  factory registerModel.fromJson(Map<String, dynamic> json) => registerModel(
    status: json['status'] ?? 999,
    message: json['message'] ?? "na");


  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}



class Result {
  String token;
  int isAccepted;

  Result({
    required this.token,
    required this.isAccepted,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    token: json['token'] ?? "na",
    isAccepted: json['isAccepted'] ?? 99,
  );

  Map<String, dynamic> toJson() => {
    "token": token,
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