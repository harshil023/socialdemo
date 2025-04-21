import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/color_constants.dart';
import '../../../widgets/custom_bottom_nav.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstants.white ,
      body: Container(
        color: ColorConstants.white,
        child: Obx(() => controller.tabs[controller.currentIndex.value]),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),  // Use the custom BottomNavigationBar widget
    );
  }
}
