import 'dart:async';
import 'package:get/get.dart';
import 'package:weather_app/Controllers/home_controller.dart';
import 'package:weather_app/Screens/Splash_Screen/splash_screen_components.dart';
import '../models/weather_model_new.dart';


class Api extends GetConnect{

 Future<dynamic> getDataByLat(int lat, int lng) async{
    Get.put(HomeController());
  Get.find<HomeController>().addError(false);
    final response = await get('http://api.weatherapi.com/v1/forecast.json?key=4889c63a9205421a83b144841222003&q=$lat,$lng&days=7&aqi=no&alerts=no');
    if(response.status.hasError){
         Get.find<HomeController>().addError(true);
      return Future.error(response.statusText!);
    } else {
        WeatherModel data = WeatherModel.fromJson(response.body);
       return data;
    }
  }

   Future<dynamic> getDataByCity(String city , context) async{
      Get.put(HomeController());
  Get.find<HomeController>().addError(false);
    final response = await get('http://api.weatherapi.com/v1/forecast.json?key=4889c63a9205421a83b144841222003&q=$city&days=7&aqi=no&alerts=no');
    if(response.status.hasError){
         Get.find<HomeController>().addError(true);
        SplashComponents().showManualDialog(context, "Error! Location Not Found", true);
      return Future.error(response.statusText!);
    } else {
       WeatherModel data = WeatherModel.fromJson(response.body);
       return data;
    }
  }

 }

