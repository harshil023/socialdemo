
import 'package:get/get.dart';
import 'package:socialdemo/views/createpost/controllers/createpost_controller.dart';
import 'package:socialdemo/views/discovery/controllers/discovery_controller.dart';
import 'package:socialdemo/views/home/controllers/home_controller.dart';
import 'package:socialdemo/views/profile/controllers/profile_controller.dart';
import 'package:socialdemo/views/setting/controllers/setting_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DiscoveryController>(() => DiscoveryController());
    Get.lazyPut<CreatepostController>(() => CreatepostController());
    Get.lazyPut<SettingController>(() => SettingController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
