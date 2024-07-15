import 'dart:async';

import 'package:get/get.dart';

import '../../../core/app_export.dart';
import '../../../routes/app_routes.dart';

class NoteBookSubjectScreenController extends GetxController {
  final List<Map<String, dynamic>> subjects = [
    {'name': 'English', 'color': Colors.red, 'initial': 'E'},
    {'name': 'Maths', 'color': Colors.blue, 'initial': 'M'},
    {'name': 'Science', 'color': Colors.green, 'initial': 'S'},
    {'name': 'Social', 'color': Colors.purple, 'initial': 'S'},
    {'name': 'Hindi', 'color': Colors.orange, 'initial': 'H'},
  ];
  @override
  void onInit() {
    super.onInit();
  }
}
