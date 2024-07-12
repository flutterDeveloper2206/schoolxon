import 'package:get/get.dart';
import 'package:schoolxon/presentation/account_screen/account_screen.dart';
import 'package:schoolxon/presentation/account_screen/binding/account_screen_binding.dart';
import 'package:schoolxon/presentation/contact_support_screen/binding/contact_support_screen_binding.dart';
import 'package:schoolxon/presentation/contact_support_screen/contact_support_screen.dart';
import 'package:schoolxon/presentation/forgetPwd_screen/binding/forgetPWD_Screen_binding.dart';
import 'package:schoolxon/presentation/forgetPwd_screen/forgetPwd_screen.dart';
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
import 'package:schoolxon/presentation/select_school_screen/binding/select_school_screen_binding.dart';
import 'package:schoolxon/presentation/select_school_screen/select_school_screen.dart';

import '../presentation/language_select_screen/binding/language_screen_binding.dart';
import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';
  static const String accountScreenRoute = '/account_screen';
  static const String contactSupportScreenRoute = '/contact_support_screen';
  static const String leaveDashboardScreenRout = '/leave_dashboard_screen';
  static const String noticeBoardScreenRout = '/notice_board_screen';
  static const String selectSchoolScreenRout = '/select_school_screen';
  static const String forgotScreenRout = '/forgot_screen';

  static const String onBoardingScreenRout = '/onBoardingScreenRout';
  static const String loginScreenRout = '/loginScreenRout';
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
        name: forgotScreenRout,
        page: () => ForgetPwdScreen(),
        bindings: [
          ForgetPwdScreenBinding(),
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
        name: selectSchoolScreenRout,
        page: () => const SelectSchoolScreen(),
        bindings: [
          SelectSchoolScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
  ];
}
