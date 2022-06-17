class locationModel {

  int status;


  int getStatus(){
    return status;
  }

  locationModel({
    required this.status,
  });


  factory locationModel.fromJson(Map<String, dynamic> json) => locationModel(
    status: json['status'] ?? 999);


  Map<String, dynamic> toJson() => {
    "status": status
  };
}

