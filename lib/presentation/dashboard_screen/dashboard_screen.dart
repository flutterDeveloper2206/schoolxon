import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/image_constant.dart';
import 'package:schoolxon/core/utils/string_constant.dart';
import '../../core/utils/color_constant.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/dashboard_screen_controller.dart';

class DashBoardScreen extends GetWidget<DashBoardScreenController> {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  CustomImageView(
                    height: 25,
                    svgPath: ImageConstant.icHome,
                    color: controller.selectedIndex.value == 0
                        ? ColorConstant.primaryBlack
                        : ColorConstant.grey63,
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
              label: AppString.home,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  CustomImageView(
                    height: 25,
                    svgPath: ImageConstant.icChat,
                    color: controller.selectedIndex.value == 1
                        ? ColorConstant.primaryBlack
                        : ColorConstant.grey63,
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
              label: AppString.chat,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  CustomImageView(
                    height: 25,
                    svgPath: ImageConstant.icReport,
                    color: controller.selectedIndex.value == 2
                        ? ColorConstant.primaryBlack
                        : ColorConstant.grey63,
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
              label: AppString.report,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  CustomImageView(
                    height: 25,
                    svgPath: ImageConstant.icProfileUser,
                    color: controller.selectedIndex.value == 3
                        ? ColorConstant.primaryBlack
                        : ColorConstant.grey63,
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
              label: AppString.profile,
            ),
          ],
          unselectedLabelStyle: PMT.appStyle(
            12,
            fontColor: ColorConstant.grey63,
          ),
          // selectedLabelStyle: PMT.appStyle(
          //   12,
          //   fontColor: ColorConstant.primaryBlack,
          // ),
          selectedItemColor: ColorConstant.primaryBlack, // Active icon color
          unselectedItemColor: ColorConstant.grey63, // Inactive icon color
        ),
      ),
    );
  }
}
