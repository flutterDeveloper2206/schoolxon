import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:schoolxon/core/utils/app_prefs_key.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';
import 'package:schoolxon/presentation/account_screen/account_screen.dart';
import 'package:schoolxon/presentation/home_screen/home_screen.dart';
import 'package:schoolxon/presentation/profile_screen/profile_screen.dart';

import '../../../core/app_export.dart';
import '../../../routes/app_routes.dart';

class DashBoardScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    Center(child: Text('Chat Page')),
    Center(child: Text('Reports Page')),
    AccountScreen(),
  ];
}
