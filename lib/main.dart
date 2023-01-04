import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:weather_app/Data/models/object_box_model.dart';
import 'package:weather_app/UI/Routes/app_routes.dart';

import 'Data/helper/object_box_helper.dart';

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
      static final ValueNotifier<ThemeMode> themeListner = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
        Box<WeatherModelObjectBox> weatherData = objectBox.store.box<WeatherModelObjectBox>();

    AppRoutes appRoutes = AppRoutes();
    return ValueListenableBuilder(
      valueListenable:themeListner ,
      builder: (context, value, child) {
        return  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoutes.onGeneratedRoute,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: weatherData.count() == 0 ? value : weatherData.get(1)!.theme == "light" ? ThemeMode.light : ThemeMode.dark,
      );
       });

  }
}
