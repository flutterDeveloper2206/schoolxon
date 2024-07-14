import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/color_constant.dart';

class ApplyLeaveScreenController extends GetxController {
  var progress = 0.0.obs;
  var imageFile = Rx<XFile?>(null);


  @override
  void onInit() {
    super.onInit();
    startProgress();
  }

  final ImagePicker _picker = ImagePicker();
  var isSickLeaveSelected = true.obs;
  var imagePath = ''.obs;
  var selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }
  void selectSickLeave() {
    isSickLeaveSelected.value = true;
  }

  void selectCasualLeave() {
    isSickLeaveSelected.value = false;
  }

  Color get sickLeaveColor =>
      isSickLeaveSelected.value ? ColorConstant.blueF9.withOpacity(.1) : Colors.transparent;

  Color get casualLeaveColor =>
      isSickLeaveSelected.value ? Colors.transparent : ColorConstant.blueF9.withOpacity(.1);

  Color get sickLeaveTextColor =>
      isSickLeaveSelected.value ? ColorConstant.blueColor42 : ColorConstant.primaryBlack;

  Color get casualLeaveTextColor =>
      isSickLeaveSelected.value ? ColorConstant.primaryBlack : ColorConstant.blueColor42;

  Color get sickLeaveBorderColor =>
      isSickLeaveSelected.value ? ColorConstant.transparent : ColorConstant.greyE4;

  Color get casualLeaveBorderColor =>
      isSickLeaveSelected.value ? ColorConstant.greyE4 : ColorConstant.transparent;


  void startProgress() {
    Timer.periodic(Duration(milliseconds:900), (timer) {
      if (progress.value >= 1) {
        timer.cancel();
      } else {
        progress.value += 0.01;
      }
    });
  }

  }
