import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socialdemo/utils/app_strings.dart';

import '../../../style/dimensions.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.settings,style: TextStyle(fontSize: Dimensions.fontSize18, fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          AppStrings.settings,
          style: TextStyle(fontSize: Dimensions.fontSize18),
        ),
      ),
    );
  }
}
