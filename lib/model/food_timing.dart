// Class to handle API response
class FoodTiming {
  // Constructor with named parameters and required default values
  FoodTiming({
    required String statusCode,
    required String message,
    required List<Response> response,
  })  : _statusCode = statusCode,
        _message = message,
        _response = response;

  // Factory constructor to create an instance from JSON
  FoodTiming.fromJson(Map<String, dynamic> json)
      : _statusCode = json['statusCode'] ?? '',
        _message = json['message'] ?? '',
        _response = (json['response'] as List<dynamic>?)
            ?.map((item) => Response.fromJson(item as Map<String, dynamic>))
            .toList() ??
            [];

  // Private fields
  String _statusCode;
  String _message;
  List<Response> _response;

  // CopyWith method to create a new instance with modified values
  FoodTiming copyWith({
    String? statusCode,
    String? message,
    List<Response>? response,
  }) =>
      FoodTiming(
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

// Class to handle individual response items
class Response {
  // Constructor with named parameters
  Response({
    required num slotId,
    required num shopId,
    required String slotStartTime,
    required String slotEndTime,
    required String name,
    required String longDesc,
    required String slotStatus,
    required String slotColor,
    required String slotRemarks,
  })  : _slotId = slotId,
        _shopId = shopId,
        _slotStartTime = slotStartTime,
        _slotEndTime = slotEndTime,
        _name = name,
        _longDesc = longDesc,
        _slotStatus = slotStatus,
        _slotColor = slotColor,
        _slotRemarks = slotRemarks;

  // Factory constructor to create an instance from JSON
  Response.fromJson(Map<String, dynamic> json)
      : _slotId = json['slotId'] ?? 0,
        _shopId = json['shopId'] ?? 0,
        _slotStartTime = json['slotStartTime'] ?? '',
        _slotEndTime = json['slotEndTime'] ?? '',
        _name = json['name'] ?? '',
        _longDesc = json['longDesc'] ?? '',
        _slotStatus = json['slotStatus'] ?? '',
        _slotColor = json['slotColor'] ?? '',
        _slotRemarks = json['slotRemarks'] ?? '';

  // Private fields
  num _slotId;
  num _shopId;
  String _slotStartTime;
  String _slotEndTime;
  String _name;
  String _longDesc;
  String _slotStatus;
  String _slotColor;
  String _slotRemarks;

  // CopyWith method to create a new instance with modified values
  Response copyWith({
    num? slotId,
    num? shopId,
    String? slotStartTime,
    String? slotEndTime,
    String? name,
    String? longDesc,
    String? slotStatus,
    String? slotColor,
    String? slotRemarks,
  }) =>
      Response(
        slotId: slotId ?? _slotId,
        shopId: shopId ?? _shopId,
        slotStartTime: slotStartTime ?? _slotStartTime,
        slotEndTime: slotEndTime ?? _slotEndTime,
        name: name ?? _name,
        longDesc: longDesc ?? _longDesc,
        slotStatus: slotStatus ?? _slotStatus,
        slotColor: slotColor ?? _slotColor,
        slotRemarks: slotRemarks ?? _slotRemarks,
      );

  // Getters
  num get slotId => _slotId;
  num get shopId => _shopId;
  String get slotStartTime => _slotStartTime;
  String get slotEndTime => _slotEndTime;
  String get name => _name;
  String get longDesc => _longDesc;
  String get slotStatus => _slotStatus;
  String get slotColor => _slotColor;
  String get slotRemarks => _slotRemarks;

  // Convert the instance to JSON format
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slotId'] = _slotId;
    map['shopId'] = _shopId;
    map['slotStartTime'] = _slotStartTime;
    map['slotEndTime'] = _slotEndTime;
    map['name'] = _name;
    map['longDesc'] = _longDesc;
    map['slotStatus'] = _slotStatus;
    map['slotColor'] = _slotColor;
    map['slotRemarks'] = _slotRemarks;
    return map;
  }
}
