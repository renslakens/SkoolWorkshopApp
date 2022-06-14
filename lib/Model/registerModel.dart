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
    message: json['message'] ?? "na"
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    // "username": lastName,
    // "email": emailAdress,
    // "address": address.toJson(),
    // "phone": phone,
    // "website": website,
    // "company": company.toJson(),
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