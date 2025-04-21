import 'dart:convert';



import 'package:socialdemo/model/postmodel/post_model.dart';
import 'package:socialdemo/services/base_services.dart';
import 'package:socialdemo/services/network_constant.dart';
import 'package:socialdemo/services/network_service.dart';
import '../model/company_list_data.dart';
import '../model/login_master.dart';
import '../model/movie_list_data.dart';
import '../model/user_list_master.dart';
import '../utils/api_request_type.dart';
import '../utils/app_constants.dart';
import '../utils/utility.dart';


class ApiServices extends BaseServices {
  NetworkService? networkService;

  ApiServices() {
    networkService = NetworkService();
  }


  @override
  Future<List<PostModel>?> fetchMediaPosts({onNoInternet, onError}) async{
    try {
      Uri uri = Uri.parse(NetworkConstant.baseUrl + NetworkConstant.postsApi + '?key=' + NetworkConstant.apiKey);
      var response = await networkService?.callRequest(
        uri: uri.toString(),
        requestType: ApiRequestType.REQUEST_GET,
        onNoInternet: onNoInternet,
        onError: onError,
      );

      if (response != null && response.data != null) {
        final List data = response.data;
        return data.map((e) => PostModel.fromJson(e)).toList();
      }
      return null;
    } catch (e, stacktrace) {
      print("Error: \$e");
      print("Stacktrace: \$stacktrace");
      return null;
    }
  }



}


