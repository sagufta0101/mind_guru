import 'package:endurance_app/presentation/screens/notes/notes_page.dart';
import 'package:get/get.dart';

import '../presentation/screens/landing/landing.dart';
import '../presentation/screens/login/login.dart';
import '../presentation/screens/login/onboarding.dart';
import '../presentation/screens/navigation/navigation.dart';
import '../presentation/screens/splash/splash_screen.dart';
import '../presentation/screens/profile/surveyforms/severity_depression_landing.dart';
import 'route_constant.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.onboarding,
      page: (() => LandingScreen()),
    ),
    GetPage(
      name: AppRoutes.login,
      page: (() => LoginScreen()),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: (() => SplashScreen()),
    ),
    GetPage(
      name: AppRoutes.mainApp,
      page: (() => Navigation()),
    ),
    GetPage(
      name: AppRoutes.noteRoute,
      page: (() => NotesPage()),
    ),
    GetPage(
      name: AppRoutes.depressionForm,
      page: (() => DepressionFormLanding()),
    ),
  ];
}
