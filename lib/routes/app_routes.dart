import 'package:get/get.dart';
import 'package:schoolxon/presentation/account_screen/account_screen.dart';
import 'package:schoolxon/presentation/account_screen/binding/account_screen_binding.dart';
import 'package:schoolxon/presentation/contact_support_screen/binding/contact_support_screen_binding.dart';
import 'package:schoolxon/presentation/contact_support_screen/contact_support_screen.dart';
import 'package:schoolxon/presentation/onboarding_screen/binding/onboarding_screen_binding.dart';
import 'package:schoolxon/presentation/onboarding_screen/onBoarding_screen.dart';

import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';
  static const String accountScreenRoute = '/account_screen';
  static const String contactSupportScreenRoute = '/contact_support_screen';

  static const String onBoardingScreenRout = '/onBoardingScreenRout';

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
        page: () => const SplashScreen(),
        bindings: [
          OnBoardingScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150))
  ];
}
