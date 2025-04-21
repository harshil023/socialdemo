import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socialdemo/utils/app_strings.dart';

import '../../../style/dimensions.dart';
import '../controllers/createpost_controller.dart';

class CreatepostView extends GetView<CreatepostController> {
  const CreatepostView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.createpost,style: TextStyle(fontSize: Dimensions.fontSize18, fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          AppStrings.createpost,
          style: TextStyle(fontSize: Dimensions.fontSize18),
        ),
      ),
    );
  }
}
