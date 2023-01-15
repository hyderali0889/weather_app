import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';
import 'package:weather_app/Theme/theme_file.dart';
import 'package:weather_app/helper/object_box_helper.dart';
import 'package:weather_app/models/object_box_model.dart';
import 'package:weather_app/utils/page_routes.dart';

import 'Routes/app_routes.dart';

late ObjectBox objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Box<WeatherModelObjectBox> weatherData =
        objectBox.store.box<WeatherModelObjectBox>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      initialRoute: weatherData.count() == 0 ? PageRoutes().splashSceen :PageRoutes().homeSceen ,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: weatherData.count() == 0
          ? ThemeMode.system
          : weatherData.get(1)!.theme == "light"
              ? ThemeMode.light
              : ThemeMode.dark,
    );
  }
}
