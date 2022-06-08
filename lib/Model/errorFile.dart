class errorFile {

  int status;
  String message;

  int getStatus(){
    return status;
  }

  errorFile({
    required this.status,
    required this.message,
  });

  factory errorFile.fromJson(Map<String, dynamic> json) => errorFile(
    status: json['status'],
    message: json['message']
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": message,
  };
}
