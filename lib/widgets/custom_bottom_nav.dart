import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/color_constants.dart';
import '../style/text_styles.dart';
import '../views/dashboard/controllers/dashboard_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTabIndex,
        selectedItemColor: ColorConstants.red,
        unselectedItemColor: ColorConstants.gray949599,
        showUnselectedLabels: true,
        backgroundColor: ColorConstants.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: "",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
            backgroundColor: Colors.transparent,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
            backgroundColor: Colors.transparent,
          ),
        ],
        selectedLabelStyle: textRedBold16,
        unselectedLabelStyle: textNormalBlack16
      ),
    );
  }
}
