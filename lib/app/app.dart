import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialdemo/views/newsplash/new_splash_binding.dart';
import '../routes/app_pages.dart';
import '../style/color_constants.dart';
import '../utils/app_strings.dart';
import 'app_controller.dart';

class MyApp extends GetView<AppController> {
  MyApp({super.key});

  final AppController _controller = Get.put(AppController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Helvetica Neue",
        primarySwatch: ColorConstants.appColor,
      ),
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1)),
            child: child!);
      },
      locale: Locale(_controller.locale),
      initialRoute: Routes.NEW_SPLASH,
      getPages: AppPages.routes,
      title: AppStrings.appName,
      initialBinding: NewSplashBinding(),
    );
  }
}
