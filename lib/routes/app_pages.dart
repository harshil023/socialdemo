import 'package:get/get.dart';
import 'package:socialdemo/views/home/bindings/home_binding.dart';
import 'package:socialdemo/views/home/views/home_view.dart';


import '../views/createpost/bindings/createpost_binding.dart';
import '../views/createpost/views/createpost_view.dart';
import '../views/dashboard/bindings/dashboard_binding.dart';
import '../views/dashboard/views/dashboard_view.dart';
import '../views/discovery/bindings/discovery_binding.dart';
import '../views/discovery/views/discovery_view.dart';

import '../views/profile/bindings/profile_binding.dart';
import '../views/profile/views/profile_view.dart';
import '../views/setting/bindings/setting_binding.dart';
import '../views/setting/views/setting_view.dart';
import '../views/splash/splash_binding.dart';
import '../views/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashView(),
        binding: SplashBinding(),
        transition: Transition.downToUp),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
      children: [
        GetPage(
          name: Routes.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.CREATEPOST,
          page: () => CreatepostView(),
          binding: CreatepostBinding(),
        ),
        GetPage(
          name: Routes.PROFILE,
          page: () => ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: Routes.SETTING,
          page: () => SettingView(),
          binding: SettingBinding(),
        ),
        GetPage(
          name: Routes.DISCOVERY,
          page: () =>  DiscoveryView(),
          binding: DiscoveryBinding(),
        ),
      ],
    ),

  ];
}
