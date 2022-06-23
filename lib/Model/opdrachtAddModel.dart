class opdrachtAddModel {

  int status;
  String message;

  opdrachtAddModel({
    required this.status,
    required this.message
  });


  factory opdrachtAddModel.fromJson(Map<String, dynamic> json) => opdrachtAddModel(
    status: json['status'] ?? "na",
    message: json['message'] ?? "na",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}

// class Result {
//   String aantalDocenten;
//   int salarisIndicatie;
//   DateTime startTijd;
//   DateTime eindTijd;
//   int locatieID;
//   int workshopID;
//
//
//   Result({
//     required this.aantalDocenten,
//     required this.startTijd,
//     required this.eindTijd,
//     required this.locatieID,
//     required this.workshopID,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     aantalDocenten: json['aantalDocenten'] ?? 0,
//     startTijd: json['startTijd'],
//     eindTijd: json['eindTijd'],
//     locatieID: json['locatieID'],
//     workshopID: json['workshopID'],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "aantalDocenten": aantalDocenten,
//     "startTijd": startTijd,
//     "eindTijd": eindTijd,
//     "locatieID": locatieID,
//     "workshopID": workshopID,
//   };
// }
