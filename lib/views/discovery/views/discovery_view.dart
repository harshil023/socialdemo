import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socialdemo/utils/app_strings.dart';

import '../../../style/dimensions.dart';
import '../controllers/discovery_controller.dart';

class DiscoveryView extends GetView<DiscoveryController> {
  const DiscoveryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.discovery,style: TextStyle(fontSize: Dimensions.fontSize18, fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
         AppStrings.discovery,
          style: TextStyle(fontSize: Dimensions.fontSize18),
        ),
      ),
    );
  }
}
