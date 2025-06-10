class ResponseMessageModel {
  final String message;

  ResponseMessageModel({required this.message});

  factory ResponseMessageModel.fromJson(Map<String, dynamic> json) =>
      ResponseMessageModel(message: json['message']);

  Map<String, dynamic> toJson() => {'message': message};
}
