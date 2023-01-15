import 'package:fl_location/fl_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../models/object_box_model.dart';
import '../../objectbox.g.dart';
import '../Home_Screen/home_screen.dart';
import '../../Theme/main_colors.dart';

class SplashComponents {
  Location? locationData;
  TextEditingController inputController = TextEditingController();

//  Function for getting Location

  Future<bool> _checkAndRequestPermission({bool? background}) async {
    if (!await FlLocation.isLocationServicesEnabled) {
      return false;
    }
    var locationPermission = await FlLocation.checkLocationPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return false;
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await FlLocation.requestLocationPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        return false;
      }
    }
    if (background == true &&
        locationPermission == LocationPermission.whileInUse) return false;

    return true;
  }

/*
     dP""b8 888888 888888 888888 88 88b 88  dP""b8     88      dP"Yb   dP""b8    db    888888 88  dP"Yb  88b 88
    dP   `" 88__     88     88   88 88Yb88 dP   `"     88     dP   Yb dP   `"   dPYb     88   88 dP   Yb 88Yb88
    Yb  "88 88""     88     88   88 88 Y88 Yb  "88     88  .o Yb   dP Yb       dP__Yb    88   88 Yb   dP 88 Y88
     YboodP 888888   88     88   88 88  Y8  YboodP     88ood8  YbodP   YboodP dP""""Yb   88   88  YbodP  88  Y8
*/

  Future<void> getLoc(context) async {
    try {
      if (await _checkAndRequestPermission()) {
        const timeLimit = Duration(seconds: 10);

        await FlLocation.getLocation(timeLimit: timeLimit).then((location) {
          locationData = location;
        }).onError((error, stackTrace) {});

        throwToDB(context);
      } else {
        showManualDialog(context, "Location Access / Services Disabled", false);
      }
    } catch (e) {
      showManualDialog(context, "Location Access / Services Disabled", false);
    }
    if (await _checkAndRequestPermission()) {
      const timeLimit = Duration(seconds: 10);

      await FlLocation.getLocation(timeLimit: timeLimit).then((location) {
        locationData = location;
      }).onError((error, stackTrace) {});

      throwToDB(context);
    } else {
      showManualDialog(
        context,
        "Location Access / Services Disabled",
        false,
      );
    }
  }

  /*
     888888 88   88 88b 88  dP""b8 888888 88  dP"Yb  88b 88     888888  dP"Yb       dP""b8 888888 888888        db    88""Yb 88     8888b.     db    888888    db
     88__   88   88 88Yb88 dP   `"   88   88 dP   Yb 88Yb88       88   dP   Yb     dP   `" 88__     88         dPYb   88__dP 88      8I  Yb   dPYb     88     dPYb
     88""   Y8   8P 88 Y88 Yb        88   88 Yb   dP 88 Y88       88   Yb   dP     Yb  "88 88""     88        dP__Yb  88"""  88      8I  dY  dP__Yb    88    dP__Yb
     88     `YbodP' 88  Y8  YboodP   88   88  YbodP  88  Y8       88    YbodP       YboodP 888888   88       dP""""Yb 88     88     8888Y"  dP""""Yb   88   dP""""Yb
 */

  void throwToDB(context) async {
    Box<WeatherModelObjectBox> weatherData =
        objectBox.store.box<WeatherModelObjectBox>();

    var themeMode = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = themeMode == Brightness.dark;

    WeatherModelObjectBox model = WeatherModelObjectBox(
        id: 0,
        latitude: locationData!.latitude.toInt(),
        longitude: locationData!.longitude.toInt(),
        city: '',
        tempInC: true,
        theme: isDarkMode ? 'dark' : 'light');

    weatherData.put(model);
    Get.offAll(const HomeScreen());
  }

  void throwCityToDB() async {
    Box<WeatherModelObjectBox> weatherData =
        objectBox.store.box<WeatherModelObjectBox>();

    var themeMode = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = themeMode == Brightness.dark;
    WeatherModelObjectBox model = WeatherModelObjectBox(
        id: 0,
        latitude: 0,
        longitude: 0,
        city: inputController.text.trim(),
        tempInC: true,
        theme: isDarkMode ? 'dark' : 'light');

    weatherData.put(model);
  }

  void updateCityinDB() async {
    Box<WeatherModelObjectBox> weatherData =
        objectBox.store.box<WeatherModelObjectBox>();

    var themeMode = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = themeMode == Brightness.dark;
    WeatherModelObjectBox model = WeatherModelObjectBox(
        id: 1,
        latitude: 0,
        longitude: 0,
        city: inputController.text.trim(),
        tempInC: true,
        theme: isDarkMode ? 'dark' : 'light');

    weatherData.put(model);
  }

  Future<dynamic> showManualDialog(context, String errorText, bool update) {
    return showDialog(
      barrierDismissible: update,
      context: context,
      builder: ((context) {
        return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MainColors().backgroundBlack,
              ),
              width: 400,
              height: 280,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(errorText,
                          style: context.textTheme.bodySmall!
                              .copyWith(color: Colors.red)),
                    ),
                    Text("Please Enter City Name",
                        style: context.textTheme.bodySmall),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                          style: context.textTheme.bodySmall,
                          onSubmitted: (val) {
                            update ? updateCityinDB() : throwCityToDB();

                            Get.offAllNamed('/home');
                          },
                          controller: inputController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                            ),
                            hintText: "Please Enter City Name",
                            hintStyle: context.textTheme.bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
                        onTap: () {
                          update ? updateCityinDB() : throwCityToDB();

                          Get.offAllNamed('/home');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.green.shade500),
                          width: 200,
                          height: 50,
                          child: Center(
                              child: Text("Proceed Ahead",
                                  style: Get.textTheme.labelLarge)),
                        ),
                      ),
                    )
                  ]),
            ));
      }),
    );
  }
}
