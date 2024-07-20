import 'package:get/get.dart';
import 'package:schoolxon/presentation/account_screen/account_screen.dart';
import 'package:schoolxon/presentation/account_screen/binding/account_screen_binding.dart';
import 'package:schoolxon/presentation/applyLeave_screen/applyLeave_screen.dart';
import 'package:schoolxon/presentation/applyLeave_screen/binding/applyLeave_screen_binding.dart';
import 'package:schoolxon/presentation/contact_support_screen/binding/contact_support_screen_binding.dart';
import 'package:schoolxon/presentation/contact_support_screen/contact_support_screen.dart';
import 'package:schoolxon/presentation/dashboard_screen/binding/dashboard_screen_binding.dart';
import 'package:schoolxon/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:schoolxon/presentation/exam_resources_screen/binding/exam_resources_screen_binding.dart';
import 'package:schoolxon/presentation/exam_resources_screen/exam_resources_screen.dart';
import 'package:schoolxon/presentation/forgetPwd_screen/binding/forgetPWD_Screen_binding.dart';
import 'package:schoolxon/presentation/forgetPwd_screen/forgetPwd_screen.dart';
import 'package:schoolxon/presentation/home_screen/binding/home_screen_binding.dart';
import 'package:schoolxon/presentation/home_screen/home_screen.dart';
import 'package:schoolxon/presentation/home_work_screen/binding/home_work_screen_binding.dart';
import 'package:schoolxon/presentation/home_work_screen/home_work_screen.dart';
import 'package:schoolxon/presentation/language_select_screen/language_select_screen.dart';
import 'package:schoolxon/presentation/leave_dashboard_screen/binding/leave_dashboard_screen_binding.dart';
import 'package:schoolxon/presentation/leave_dashboard_screen/leave_dashboard_screen.dart';
import 'package:schoolxon/presentation/leave_details_screen/binding/leave_details_screen_binding.dart';
import 'package:schoolxon/presentation/leave_details_screen/leave_details_screen.dart';
import 'package:schoolxon/presentation/login_screen/binding/login_screen_binding.dart';
import 'package:schoolxon/presentation/login_screen/login_screen.dart';
import 'package:schoolxon/presentation/attendance/attendance_screen.dart';
import 'package:schoolxon/presentation/attendance/binding/attendance_screen_binding.dart';
import 'package:schoolxon/presentation/not_book_subject_screen/binding/not_book_subject_screen_binding.dart';
import 'package:schoolxon/presentation/not_book_subject_screen/not_book_subject_screen.dart';
import 'package:schoolxon/presentation/note_list_screen/binding/note_list_screen_binding.dart';
import 'package:schoolxon/presentation/note_list_screen/note_list_screen.dart';
import 'package:schoolxon/presentation/note_show_screen/binding/note_show_screen_binding.dart';
import 'package:schoolxon/presentation/note_show_screen/note_show_screen.dart';
import 'package:schoolxon/presentation/notice_board_screen/binding/notice_board_screen_binding.dart';
import 'package:schoolxon/presentation/notice_board_screen/notice_board_screen.dart';
import 'package:schoolxon/presentation/onboarding_screen/binding/onboarding_screen_binding.dart';
import 'package:schoolxon/presentation/onboarding_screen/onBoarding_screen.dart';
import 'package:schoolxon/presentation/profile_screen/binding/profile_screen_binding.dart';
import 'package:schoolxon/presentation/profile_screen/profile_screen.dart';
import 'package:schoolxon/presentation/select_school_screen/binding/select_school_screen_binding.dart';
import 'package:schoolxon/presentation/select_school_screen/select_school_screen.dart';
import 'package:schoolxon/presentation/submit_home_work_screen/binding/submit_home_work_screen_binding.dart';
import 'package:schoolxon/presentation/submit_home_work_screen/submit_home_work_screen.dart';
import 'package:schoolxon/presentation/write_note_screen/binding/write_note_screen_binding.dart';
import 'package:schoolxon/presentation/write_note_screen/write_note_screen.dart';

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
  static const String selectSchoolScreenRout = '/select_school_screen';
  static const String forgotScreenRout = '/forgot_screen';
  static const String profileScreenRout = '/profile_screen';
  static const String noteBookSubjectScreenRout = '/note_book_subject_screen';
  static const String noteListScreenRout = '/note_list_screen';
  static const String writeNoteScreenRout = '/write_note_screen';
  static const String noteShowScreenRout = '/note_show_screen';
  static const String dashBoardScreenRout = '/dashboard_screen';
  static const String leaveDetailsScreenRout = '/leave_details_screen';

  static const String onBoardingScreenRout = '/onBoardingScreenRout';
  static const String applyLeaveScreenRout = '/applyLeaveScreenRout';
  static const String loginScreenRout = '/loginScreenRout';
  static const String homeScreenRout = '/homeScreenRout';
  static const String homeWorkScreenRout = '/homeWorkScreenRout';
  static const String homeWorkDetailScreenRout = '/homeWorkDetailScreenRout';
  static const String languageSelectScreenRout = '/languageSelectScreenRout';
  static const String examResourcesScreenRout = '/examResourcesScreenRout';
  static const String submitHomeWorkScreenRout = '/submitHomeWorkScreenRout';

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
        page: () => const LoginScreen(),
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
        page: () => const LanguageSelectScreen(),
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
        page: () => const HomeWorkScreen(),
        bindings: [
          HomeWorkScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: homeWorkDetailScreenRout,
        page: () => const HomeWorkDetailScreen(),
        bindings: [
          HomeWorkDetailScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: homeScreenRout,
        page: () => const HomeScreen(),
        bindings: [
          HomeScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: profileScreenRout,
        page: () => const ProfileScreen(),
        bindings: [
          ProfileScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: selectSchoolScreenRout,
        page: () => const SelectSchoolScreen(),
        bindings: [
          SelectSchoolScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: noteBookSubjectScreenRout,
        page: () => const NoteBookSubjectScreen(),
        bindings: [
          NoteBookSubjectScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: noteListScreenRout,
        page: () => const NoteListScreen(),
        bindings: [
          NoteListScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: writeNoteScreenRout,
        page: () => const WriteNoteScreen(),
        bindings: [
          WriteNoteScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: examResourcesScreenRout,
        page: () => const ExamResourcesScreen(),
        bindings: [
          ExamResourcesScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: noteShowScreenRout,
        page: () => const NoteShowScreen(),
        bindings: [
          NoteShowScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: dashBoardScreenRout,
        page: () => const DashBoardScreen(),
        bindings: [
          DashBoardScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: leaveDetailsScreenRout,
        page: () => const LeaveDetailsScreen(),
        bindings: [
          LeaveDetailsScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: submitHomeWorkScreenRout,
        page: () => SubmitHomeWorkScreen(),
        bindings: [
          SubmitHomeWorkScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
  ];
}
