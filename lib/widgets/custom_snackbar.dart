import '../core/app_export.dart';
import '../core/utils/color_constant.dart';

class CustomSnackBar {
  static void showSnackBar({headerText, bodyText}) {
    Get.closeAllSnackbars();
    Get.snackbar(headerText, bodyText,
        snackPosition: SnackPosition.TOP,
        colorText: ColorConstant.primaryBlack,
        backgroundColor: Color(0x66FFFFFF),
        margin: EdgeInsets.only(bottom: 26, left: 16, right: 16));
  }

  static void showTitleSnackBar(
      {required headerText,
      Duration? duration = const Duration(seconds: 3),
      EdgeInsets? margin,
      Color? color}) {
    Get.closeAllSnackbars();

    Get.rawSnackbar(
        duration: duration,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: color ?? ColorConstant.primaryBlue,
        borderRadius: getWidth(12),
        messageText: Text(
          headerText,
          style: const TextStyle(color: Colors.white),
        ),
        margin: const EdgeInsets.only(top: 60, left: 16, right: 16));
  }
}
