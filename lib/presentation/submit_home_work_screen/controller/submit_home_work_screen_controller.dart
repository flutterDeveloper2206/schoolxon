import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_export.dart';

class SubmitHomeWorkScreenController extends GetxController {
  TextEditingController descriptionController = TextEditingController();
  var progress = 0.0.obs;
  var imageFile = Rx<XFile?>(null);
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
  }

  final ImagePicker _picker = ImagePicker();
  var isSickLeaveSelected = true.obs;
  var imagePath = ''.obs;
  var selectedImage = Rx<File?>(null);


  void removeImage() {
    timer?.cancel();
    progress.value = 0.0;
    selectedImage.value = null;

  }
  void startProgress() {
    progress.value = 0.0;

    timer=  Timer.periodic(Duration(microseconds: 100000), (timer) {
      if (progress.value >= 1) {
        timer.cancel();
      } else {
        progress.value += 0.01;
      }
    });
  }
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);

      startProgress();
    }
  }



}