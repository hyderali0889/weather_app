import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:weather_app/Controllers/home_controller.dart';
import 'package:weather_app/Screens/Splash_Screen/splash_screen_components.dart';

import '../models/object_box_model.dart';
import '../objectbox.g.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Box<WeatherModelObjectBox> box = Get.arguments;

  void changeToLightMode() {
    WeatherModelObjectBox lightMode = WeatherModelObjectBox(
      id: 1,
      city: box.get(1)!.city,
      latitude: box.get(1)!.latitude,
      longitude: box.get(1)!.longitude,
      tempInC: box.get(1)!.tempInC,
      theme: "light",
    );
    box.put(lightMode);

    Get.changeThemeMode(ThemeMode.light);
  }

  void changeToDarkMode() {
    WeatherModelObjectBox darkMode = WeatherModelObjectBox(
      id: 1,
      city: box.get(1)!.city,
      latitude: box.get(1)!.latitude,
      longitude: box.get(1)!.longitude,
      tempInC: box.get(1)!.tempInC,
      theme: "dark",
    );
    box.put(darkMode);

    Get.changeThemeMode(ThemeMode.dark);
  }

  void changeToCMode() {
    WeatherModelObjectBox lightMode = WeatherModelObjectBox(
      id: 1,
      city: box.get(1)!.city,
      latitude: box.get(1)!.latitude,
      longitude: box.get(1)!.longitude,
      tempInC: true,
      theme: box.get(1)!.theme,
    );
    box.put(lightMode);
    setState(() {});
    Get.offAllNamed('/home');
  }

  void changeToFMode() {
    WeatherModelObjectBox darkMode = WeatherModelObjectBox(
      id: 1,
      city: box.get(1)!.city,
      latitude: box.get(1)!.latitude,
      longitude: box.get(1)!.longitude,
      tempInC: false,
      theme: box.get(1)!.theme,
    );
    box.put(darkMode);
    setState(() {});
    Get.offAllNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.lightArrowLeft,
                        color: context.textTheme.labelLarge!.color,
                      )),
                  Text(
                    "Settings Screen",
                    style: context.textTheme.labelLarge,
                  ),
                  Container()
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change the Temprature Scale to ${box.get(1)!.tempInC ? "F" : "C"} ",
                      style: context.textTheme.labelLarge,
                    ),
                    Switch(
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.red,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.green,
                        value: box.get(1)!.tempInC,
                        onChanged: (val) {
                          if (box.get(1)!.tempInC) {
                            controller.changeSystem(false);
                            changeToFMode();
                          } else {
                            controller.changeSystem(true);

                            changeToCMode();
                          }
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Turn On ${box.get(1)!.theme == "light" ? "Dark" : "Light"} Theme",
                      style: context.textTheme.labelLarge,
                    ),
                    Switch(
                        inactiveThumbColor: Colors.black,
                        inactiveTrackColor: Colors.black,
                        activeColor: Colors.white,
                        activeTrackColor: Colors.white,
                        value: box.get(1)!.theme == "dark" ? true : false,
                        onChanged: (val) {
                          if (box.get(1)!.theme == "light") {
                            changeToDarkMode();
                          } else {
                            changeToLightMode();
                          }
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 15, left: 15),
                child: InkWell(
                  onTap: () {
                    SplashComponents()
                        .showManualDialog(context, "Enter City Name", true);
                  },
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.red.shade500),
                    child: Center(
                      child: Text(
                        "Change City",
                        style: context.textTheme.labelLarge,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
