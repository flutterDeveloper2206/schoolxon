import 'package:get/get.dart';
import 'package:schoolxon/presentation/attendance/attendance_screen.dart';
import 'package:schoolxon/presentation/attendance/binding/attendance_screen_binding.dart';
import 'package:schoolxon/presentation/onboarding_screen/binding/onboarding_screen_binding.dart';
import 'package:schoolxon/presentation/onboarding_screen/onBoarding_screen.dart';

import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';

  static const String onBoardingScreenRout = '/onBoardingScreenRout';

  static const String attendanceScreenRout = '/attendanceScreenRout';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
        name: splashScreenRoute,
        page: () =>  const SplashScreen(),
        bindings: [
          SplashScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: onBoardingScreenRout,
        page: () =>   OnBoardingScreen(),
        bindings: [
          OnBoardingScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: attendanceScreenRout,
        page: () =>  const AttendanceScreen(),
        bindings: [
          AttendanceScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
  ];

}
