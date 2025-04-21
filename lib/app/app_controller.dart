
import '../controller/base_controller.dart';
import '../services/index.dart';
import '../utils/app_strings.dart';

class AppController extends BaseController {
  var locale = AppStrings.languageEnglish;

  @override
  void onInit() {
    super.onInit();
    Services().setAppConfig();
  }
}
