import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../utils/api_request_type.dart';

class NetworkService {
  final Dio _dio = Dio();

  NetworkService() {
    // Bypass SSL validation for development only
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };
  }
  Future<Map<String, String>> _getAuthHeaders(bool isHeaderRequired) async {

    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    return headers;
  }
  Future<Response?> callRequest({
    required String uri,
    Map<String, dynamic>? params,
    required String requestType,
    Map<String, dynamic>? query,
    Function? onNoInternet,
    Function? onError,
    String? bearerToken,
    String? encryptedRequestData,
    bool isHeaderRequired=true
  }) async {
    // if (await Utility.isConnected()) {
      try {
        Response response;
        final headers = await _getAuthHeaders(isHeaderRequired);
        Options options = Options(
          headers: headers,
        );

        switch (requestType) {
          case ApiRequestType.REQUEST_POST:
            print(json.encode(params));
            response = await _dio.post(uri, data: json.encode(params), options: options);
            break;
          case ApiRequestType.REQUEST_POST_ENCRYPTED:
            response = await _dio.post(uri, data: encryptedRequestData, options: options);
            break;

          case ApiRequestType.REQUEST_GET:
            response = await _dio.get(uri, queryParameters: query, options: options);
            break;

          default:
            throw UnimplementedError('Request type not supported');
        }


        if (response.statusCode == 200) {
          return response;
        } else {
          final responseData = response.data is String ? json.decode(response.data) : response.data;
          final errorMessage = responseData['message'];
          if (onError != null) onError(errorMessage);
          return null;
        }
      } catch (err) {
        onError!("Something went wrong please try after sometime");
        print("Error: $err");
        return null;
      }
  }
}
