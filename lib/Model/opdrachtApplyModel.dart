class opdrachtApplyModel {

  int status;
  String message;

  opdrachtApplyModel({
    required this.status,
    required this.message
  });


  factory opdrachtApplyModel.fromJson(Map<String, dynamic> json) => opdrachtApplyModel(
    status: json['status'] ?? "na",
    message: json['message'] ?? "na",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}



// class Result {
//   String naam;
//   String beschrijving;
//
//   Result({
//     required this.naam,
//     required this.beschrijving
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     naam: json['naam'] ?? "na",
//     beschrijving: json['beschrijving'] ?? "na",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "naam": naam,
//     "beschrijving": beschrijving,
//   };
// }
