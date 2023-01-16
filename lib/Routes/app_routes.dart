import 'package:get/get.dart';
import 'package:weather_app/Bindings/home_binding.dart';
import 'package:weather_app/Screens/no_internet_screen.dart';
import 'package:weather_app/Screens/settings_screen.dart';
import 'package:weather_app/utils/page_routes.dart';
import '../Screens/Home_Screen/home_screen.dart';
import '../Screens/Splash_Screen/splash_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: PageRoutes().splashSceen, page: (() => const SplashScreen() ) , binding: HomeBinding()),
    GetPage(name:  PageRoutes().homeSceen, page: (() => const HomeScreen()), binding: HomeBinding()),
    GetPage(name:  PageRoutes().settingsSceen, page: (() => const SettingsScreen()) ),
    GetPage(name:  PageRoutes().noInternetScreen, page: (() => const NoInternetScreen()) ),



  ];
}
