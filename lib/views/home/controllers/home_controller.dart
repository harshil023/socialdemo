import 'package:get/get.dart';
import '../../../model/postmodel/post_model.dart';
import '../../../services/api_service.dart';

class HomeController extends GetxController {
  // POSTS + LOADING
  var posts = <PostModel>[].obs;
  var isLoading = true.obs;

  // UI STATE: for each ListView index, track carousel index and visibility
  final RxMap<int, int> sliderIndexMap = <int,int>{}.obs;
  final RxMap<int, bool> visibleMap = <int,bool>{}.obs;

  final _apiService = ApiServices();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      final result = await _apiService.fetchMediaPosts(
        onError: (err) => Get.snackbar("Error", err.toString()),
      );
      if (result != null) {
        posts.value = result;
        // initialize maps
        for (var i = 0; i < posts.length; i++) {
          sliderIndexMap[i] = 0;
          visibleMap[i] = false;
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void setSlider(int itemIndex, int carouselIndex) {
    sliderIndexMap[itemIndex] = carouselIndex;
  }

  void setVisible(int itemIndex, bool isVisible) {
    visibleMap[itemIndex] = isVisible;
  }
}
