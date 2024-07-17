import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/error_screen.dart';

import 'core/app_export.dart';
import 'core/utils/initial_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  ErrorWidget.builder =
      (FlutterErrorDetails details) => AppFlutterErrorScreen(details: details);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      locale: Get.deviceLocale,
      //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: 'SCHOOL XON',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.examResourcesScreenRout,
      getPages: AppRoutes.pages,
      // ),
    );
  }
}
