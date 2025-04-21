import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socialdemo/utils/app_strings.dart';

import '../../../style/dimensions.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.profile,style: TextStyle(fontSize: Dimensions.fontSize18, fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          AppStrings.profile,
            style: TextStyle(fontSize: Dimensions.fontSize18),
        ),
      ),
    );
  }
}
