import 'dart:async';
import 'package:get/get.dart';
import 'package:weather_app/Controllers/home_controller.dart';
import 'package:weather_app/Screens/Splash_Screen/splash_screen_components.dart';
import '../models/weather_model_new.dart';
import '../utils/page_routes.dart';

class Api extends GetConnect {
  Future<dynamic> getDataByLat(
      int lat, int lng, context, inputController) async {
    try {
      final response = await get(
          'http://api.weatherapi.com/v1/forecast.json?key=4889c63a9205421a83b144841222003&q=$lat,$lng&days=7&aqi=no&alerts=no');
      if (response.statusCode == 400) {
        SplashComponents().showManualDialog(
            context, "Error! Location Not Found", true, inputController);
        Get.find<HomeController>().addError(true);
      } else if (response.status.hasError) {
        Get.offAllNamed(PageRoutes().noInternetScreen);
      } else {
        WeatherModel data = WeatherModel.fromJson(response.body);
        return data;
      }
    } catch (e) {
      SplashComponents().showManualDialog(
          context, "Error! Location Not Found", true, inputController);
    }
  }

  Future<dynamic> getDataByCity(String city, context, inputController) async {
    try {
      final response = await get(
          'http://api.weatherapi.com/v1/forecast.json?key=4889c63a9205421a83b144841222003&q=$city&days=7&aqi=no&alerts=no');
      if (response.statusCode == 400) {
        SplashComponents().showManualDialog(
            context, "Error! Location Not Found", true, inputController);
        Get.find<HomeController>().addError(true);
      } else if (response.status.hasError) {
        Get.offAllNamed(PageRoutes().noInternetScreen);
      } else {
        WeatherModel data = WeatherModel.fromJson(response.body);
        return data;
      }
    } catch (e) {
      SplashComponents().showManualDialog(
          context, "Error! Location Not Found", true, inputController);
    }
  }
}
