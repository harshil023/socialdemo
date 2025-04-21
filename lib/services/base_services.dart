import 'package:socialdemo/model/postmodel/post_model.dart';

abstract class BaseServices {
  Future<List<PostModel>?> fetchMediaPosts({onNoInternet, onError});
}
