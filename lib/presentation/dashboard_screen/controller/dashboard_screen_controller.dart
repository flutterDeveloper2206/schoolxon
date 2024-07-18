import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:schoolxon/core/utils/app_prefs_key.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';

import '../../../core/app_export.dart';
import '../../../routes/app_routes.dart';

class DashBoardScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Chat Page')),
    Center(child: Text('Reports Page')),
    Center(child: Text('Profile Page')),
  ];
}
