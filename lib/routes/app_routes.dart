import 'package:get/get.dart';
import 'package:schoolxon/presentation/account_screen/account_screen.dart';
import 'package:schoolxon/presentation/account_screen/binding/account_screen_binding.dart';
import 'package:schoolxon/presentation/applyLeave_screen/applyLeave_screen.dart';
import 'package:schoolxon/presentation/applyLeave_screen/binding/applyLeave_screen_binding.dart';
import 'package:schoolxon/presentation/contact_support_screen/binding/contact_support_screen_binding.dart';
import 'package:schoolxon/presentation/contact_support_screen/contact_support_screen.dart';
import 'package:schoolxon/presentation/home_work_screen/binding/home_work_screen_binding.dart';
import 'package:schoolxon/presentation/home_work_screen/home_work_screen.dart';
import 'package:schoolxon/presentation/language_select_screen/language_select_screen.dart';
import 'package:schoolxon/presentation/leave_dashboard_screen/binding/leave_dashboard_screen_binding.dart';
import 'package:schoolxon/presentation/leave_dashboard_screen/leave_dashboard_screen.dart';
import 'package:schoolxon/presentation/login_screen/binding/login_screen_binding.dart';
import 'package:schoolxon/presentation/login_screen/login_screen.dart';
import 'package:schoolxon/presentation/attendance/attendance_screen.dart';
import 'package:schoolxon/presentation/attendance/binding/attendance_screen_binding.dart';
import 'package:schoolxon/presentation/notice_board_screen/binding/notice_board_screen_binding.dart';
import 'package:schoolxon/presentation/notice_board_screen/notice_board_screen.dart';
import 'package:schoolxon/presentation/onboarding_screen/binding/onboarding_screen_binding.dart';
import 'package:schoolxon/presentation/onboarding_screen/onBoarding_screen.dart';

import '../presentation/home_work_detail_screen/binding/home_work_detail_screen_binding.dart';
import '../presentation/home_work_detail_screen/home_work_detail_screen.dart';
import '../presentation/language_select_screen/binding/language_screen_binding.dart';
import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';
  static const String accountScreenRoute = '/account_screen';
  static const String contactSupportScreenRoute = '/contact_support_screen';
  static const String leaveDashboardScreenRout = '/leave_dashboard_screen';
  static const String noticeBoardScreenRout = '/notice_board_screen';
  static const String onBoardingScreenRout = '/onBoardingScreenRout';
  static const String applyLeaveScreenRout = '/applyLeaveScreenRout';
  static const String loginScreenRout = '/loginScreenRout';
  static const String homeWorkScreenRout = '/homeWorkScreenRout';
  static const String homeWorkDetailScreenRout = '/homeWorkDetailScreenRout';
  static const String languageSelectScreenRout = '/languageSelectScreenRout';

  static const String attendanceScreenRout = '/attendanceScreenRout';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
        name: splashScreenRoute,
        page: () => const SplashScreen(),
        bindings: [
          SplashScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: accountScreenRoute,
        page: () => const AccountScreen(),
        bindings: [
          AccountScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: contactSupportScreenRoute,
        page: () => const ContactSupportScreen(),
        bindings: [
          ContactSupportScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: onBoardingScreenRout,
        page: () => OnBoardingScreen(),
        bindings: [
          OnBoardingScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: loginScreenRout,
        page: () => LoginScreen(),
        bindings: [
          LoginScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: languageSelectScreenRout,
        page: () => LanguageSelectScreen(),
        bindings: [
          LanguageSelectScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: leaveDashboardScreenRout,
        page: () => const LeaveDashBoardScreen(),
        bindings: [
          LeaveDashBoardScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: attendanceScreenRout,
        page: () => const AttendanceScreen(),
        bindings: [
          AttendanceScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: noticeBoardScreenRout,
        page: () => const NoticeBoardScreen(),
        bindings: [
          NoticeBoardScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: applyLeaveScreenRout,
        page: () => const ApplyLeaveScreen(),
        bindings: [
          ApplyLeaveScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: homeWorkScreenRout,
        page: () =>  HomeWorkScreen(),
        bindings: [
          HomeWorkScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: homeWorkDetailScreenRout,
        page: () =>  HomeWorkDetailScreen(),
        bindings: [
          HomeWorkDetailScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
  ];
}
