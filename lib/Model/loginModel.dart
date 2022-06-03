class loginModel {
  int status;

  Result result;
  // final String naam;
  // final String achternaam;
  // final String emailadres;
  // final String wachtwoord;

  loginModel({
    required this.status,
    required this.result
  });

  factory loginModel.fromJson(Map<String, dynamic> json) => loginModel(
      status: json['status'],
      // result: json['result']
      result: Result.fromJson(json["result"]),
      // naam: json['naam'],
      // achternaam: json['achternaam'],
      // emailadres: json['emailadres'],
      // wachtwoord: json['wachtwoord']
    );

  Map<String, dynamic> toJson() => {
    "status": status,
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


  Result({
    required this.token,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      token: json['token']
  );

  Map<String, dynamic> toJson() => {
    "token": token,
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