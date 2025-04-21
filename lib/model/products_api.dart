/// Represents the API response for products.
class ProductsApi {
  ProductsApi({
    required this.statusCode,
    required this.message,
    this.response,
  });

  factory ProductsApi.fromJson(Map<String, dynamic> json) {
    return ProductsApi(
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      response: json['response'] != null ? Response.fromJson(json['response']) : null,
    );
  }

  final int statusCode;
  final String message;
  final Response? response;

  ProductsApi copyWith({
    int? statusCode,
    String? message,
    Response? response,
  }) {
    return ProductsApi(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      response: response ?? this.response,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
    };
    if (response != null) {
      map['response'] = response!.toJson();
    }
    return map;
  }
}

/// Example Response class (make sure to customize this to fit your needs).
class Response {
  Response({
    // Define your properties here
    this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      // Initialize your properties from the JSON here
      data: json['data'], // Example property
    );
  }

  final dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'data': data, // Example property
    };
    return map;
  }
}
