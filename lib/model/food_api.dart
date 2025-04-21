// Class to handle API response
class FoodApi {
  // Constructor with named parameters and required default values
  FoodApi({
    required String statusCode,
    required String message,
    required List<Response> response,
  })  : _statusCode = statusCode,
        _message = message,
        _response = response;

  // Factory constructor to create an instance from JSON
  FoodApi.fromJson(Map<String, dynamic> json)
      : _statusCode = json['statusCode'] ?? '',
        _message = json['message'] ?? '',
        _response = (json['response'] as List<dynamic>?)
            ?.map((item) => Response.fromJson(item))
            .toList() ??
            [];

  // Private fields
  String _statusCode;
  String _message;
  List<Response> _response;

  // CopyWith method to create a new instance with modified values
  FoodApi copyWith({
    String? statusCode,
    String? message,
    List<Response>? response,
  }) =>
      FoodApi(
        statusCode: statusCode ?? _statusCode,
        message: message ?? _message,
        response: response ?? _response,
      );

  // Getters
  String get statusCode => _statusCode;
  String get message => _message;
  List<Response> get response => _response;

  // Convert the instance to JSON format
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    map['response'] = _response.map((v) => v.toJson()).toList();
    return map;
  }
}

/// Class to handle individual response items
class Response {
  // Constructor with named parameters
  Response({
    required num catId,
    required String name,
  })  : _catId = catId,
        _name = name;

  // Factory constructor to create an instance from JSON
  Response.fromJson(Map<String, dynamic> json)
      : _catId = json['catId'] ?? 0,
        _name = json['name'] ?? '';

  // Private fields
  num _catId;
  String _name;

  // CopyWith method to create a new instance with modified values
  Response copyWith({
    num? catId,
    String? name,
  }) =>
      Response(
        catId: catId ?? _catId,
        name: name ?? _name,
      );

  // Getters
  num get catId => _catId;
  String get name => _name;

  // Convert the instance to JSON format
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['catId'] = _catId;
    map['name'] = _name;
    return map;
  }
}
