class EncryptedDataResponse {
  EncryptedDataResponse({
      this.statusCode, 
      this.message, 
      this.response,});

  EncryptedDataResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    response = json['response'];
  }
  String? statusCode;
  String? message;
  String? response;
EncryptedDataResponse copyWith({  String? statusCode,
  String? message,
  String? response,
}) => EncryptedDataResponse(  statusCode: statusCode ?? this.statusCode,
  message: message ?? this.message,
  response: response ?? this.response,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['response'] = response;
    return map;
  }

}