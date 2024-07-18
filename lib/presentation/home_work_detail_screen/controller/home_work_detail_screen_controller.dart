import 'dart:async';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeWorkDetailScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startProgress();
  }
  final ImagePicker _picker = ImagePicker();
  var progress = 0.0.obs;

  Future<void> openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the selected image
    }
  }

  Future<void> openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the selected image
    }
  }
  void startProgress() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (progress.value >= 1) {
        timer.cancel();
      } else {
        progress.value += 0.01;
      }
    });
  }
}