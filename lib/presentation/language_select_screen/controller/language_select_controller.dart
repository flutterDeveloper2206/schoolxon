import 'package:get/get.dart';

class LanguageSelectScreenController extends GetxController {
  RxBool isChecked = false.obs;
  final RxList<Map<String, dynamic>> languages = [
    {'name': 'English', 'isSelected': false},
    {'name': 'Hindi', 'isSelected': false},
    {'name': 'Punjabi', 'isSelected': false},
    {'name': 'Marathi', 'isSelected': false},
    {'name': 'Odia', 'isSelected': false},
    {'name': 'Telugu', 'isSelected': false},
  ].obs;

  void onItemSelect(int selectedIndex) {
    for (int i = 0; i < languages.length; i++) {
      languages[i]['isSelected'] = i == selectedIndex;
    }
    languages.refresh();
  }
}
