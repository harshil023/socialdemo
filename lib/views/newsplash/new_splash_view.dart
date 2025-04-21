import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:socialdemo/utils/app_strings.dart';
import 'package:socialdemo/views/newsplash/new_splash_controller.dart';

import '../../style/color_constants.dart';
import '../../style/dimensions.dart';

class NewSplashView extends GetView<NewSplashController> {
  const NewSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder(
      init: NewSplashController(),
      builder: (NewSplashController controller) {
        return Scaffold(
          body: Container(
            color: ColorConstants.white,
            height: Dimensions.screenHeight,
            width: Dimensions.screenWidth,
            alignment: Alignment.center, // ✅ Center the child
            child: Text(
              AppStrings.social_demo,
              style: TextStyle(
                fontSize: Dimensions.fontSize24,
                fontWeight: FontWeight.bold, // ✅ Bold font
                color: ColorConstants.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
