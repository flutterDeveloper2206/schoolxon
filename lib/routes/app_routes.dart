import 'package:get/get.dart';
import 'package:schoolxon/presentation/language_select_screen/language_select_screen.dart';
import 'package:schoolxon/presentation/login_screen/binding/login_screen_binding.dart';
import 'package:schoolxon/presentation/login_screen/login_screen.dart';
import 'package:schoolxon/presentation/onboarding_screen/binding/onboarding_screen_binding.dart';
import 'package:schoolxon/presentation/onboarding_screen/onBoarding_screen.dart';

import '../presentation/language_select_screen/binding/language_screen_binding.dart';
import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';

  static const String onBoardingScreenRout = '/onBoardingScreenRout';
  static const String loginScreenRout = '/loginScreenRout';
  static const String languageSelectScreenRout = '/languageSelectScreenRout';

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
        page: () =>  const SplashScreen(),
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
        transitionDuration: const Duration(milliseconds: 150))
  ];

}
