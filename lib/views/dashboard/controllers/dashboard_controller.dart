
import 'package:get/get.dart';
import 'package:socialdemo/views/createpost/views/createpost_view.dart';
import 'package:socialdemo/views/discovery/views/discovery_view.dart';
import 'package:socialdemo/views/home/views/home_view.dart';
import 'package:socialdemo/views/profile/views/profile_view.dart';
import 'package:socialdemo/views/setting/views/setting_view.dart';


class DashboardController extends GetxController {
  var currentIndex = 0.obs; // Home tab selected by default

  final tabs = [
    HomeView(),
    DiscoveryView(),
    CreatepostView(),
    SettingView(),
    ProfileView(),
  ];

  void changeTabIndex(int index) {


    if(currentIndex.value!=index){
      currentIndex.value = index;

    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
