import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/utils/size_utils.dart';

import 'color_constant.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              ColorConstant.primaryBlue,
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  static void showProgressDialogSmall({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorConstant.primaryRed,
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }

  static void showSnackBar({headerText, bodyText}) {
    Get.closeAllSnackbars();
    Get.snackbar(headerText, bodyText,
        snackPosition: SnackPosition.BOTTOM,
        colorText: ColorConstant.primaryBlack,
        backgroundColor: ColorConstant.lightOrangeOutline,
        margin: const EdgeInsets.only(bottom: 26, left: 16, right: 16));
  }

  static void showTitleSnackBar(
      {required headerText,
      Duration? duration = const Duration(seconds: 3),
      EdgeInsets? margin,
      bool error = false,
      Color? color}) {
    Get.closeAllSnackbars();

    Get.rawSnackbar(
        duration: duration,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: error
            ? ColorConstant.primaryRed
            : color ?? ColorConstant.primaryBlack,
        borderRadius: getWidth(12),
        messageText: InkWell(
          onTap: () {
            Get.closeAllSnackbars();
            print('object');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                headerText,
                style: const TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.close,
                color: ColorConstant.primaryWhite,
              )
            ],
          ),
        ),
        margin: const EdgeInsets.only(bottom: 30, left: 16, right: 16));
  }
}
