import 'package:flutter/material.dart';
import 'package:weather_app/UI/Screens/home_screen.dart';
import 'package:weather_app/UI/Screens/splash_screen.dart';

import '../../Data/models/object_box_model.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class AppRoutes {
  Box<WeatherModelObjectBox> weatherData =
      objectBox.store.box<WeatherModelObjectBox>();

  Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return weatherData.count() == 0
            ? MaterialPageRoute(builder: ((context) => const SplashScreen()))
            : MaterialPageRoute(builder: ((context) => const HomeScreen()));
      default:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
    }
  }
}
