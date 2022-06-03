class loginModel {
  final int status;
  // final String naam;
  // final String achternaam;
  // final String emailadres;
  // final String wachtwoord;


  const loginModel({required this.status});

  factory loginModel.fromJson(Map<String, dynamic> json) {
    return loginModel(
      status: json['status'],
      // naam: json['naam'],
      // achternaam: json['achternaam'],
      // emailadres: json['emailadres'],
      // wachtwoord: json['wachtwoord']
    );
  }
}