class loginModel {

  int status;
  String message;
  Result result;
  // final String naam;
  // final String achternaam;
  // final String emailadres;
  // final String wachtwoord;


  int getStatus(){
    return status;
  }

  loginModel({
    required this.status,
    required this.result,
    required this.message
  });


  factory loginModel.fromJson(Map<String, dynamic> json) => loginModel(
      status: json['status'] ?? 999,
      message: json['message'] ?? "na",
      result: Result.fromJson(json["result"]),
      // naam: json['naam'],
      // achternaam: json['achternaam'],
      // emailadres: json['emailadres'],
      // wachtwoord: json['wachtwoord']
    );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
    // "username": lastName,
    // "email": emailAdress,
    // "address": address.toJson(),
    // "phone": phone,
    // "website": website,
    // "company": company.toJson(),
  };
}



class Result {
  String token;
  String emailadres;
  String voornaam;
  String rol;
  int isAccepted;

  Result({
    required this.token,
    required this.emailadres,
    required this.voornaam,
    required this.rol,
    required this.isAccepted,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      token: json['token'] ?? "na",
      emailadres: json['emailadres'] ?? "na",
      voornaam: json['voornaam'] ?? "na",
      rol: json['rol'] ?? "Docent",
      isAccepted: json['isAccepted'] ?? 99,
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "emailadres": emailadres,
    "voornaam": voornaam,
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