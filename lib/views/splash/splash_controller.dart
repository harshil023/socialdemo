import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/base_controller.dart';
import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../utils/utility.dart';

class SplashController extends BaseController {

  @override
  void onInit() {
    splashTimer();
    super.onInit();
  }

  void splashTimer() async {


    var _duration = Duration(
      seconds: Dimensions.screenLoadTime,
    );
    Future.delayed(_duration, () async {
      printf("Navigate to next screen");
      Get.offNamedUntil(Routes.DASHBOARD, (route) => false);
    });
  }
}