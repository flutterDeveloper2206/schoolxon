import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:schoolxon/core/utils/image_constant.dart';
import '../../core/utils/color_constant.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.black72,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(70),
            child: CustomImageView(
              svgPath: ImageConstant.imgSplashLogo,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ));
  }
}
