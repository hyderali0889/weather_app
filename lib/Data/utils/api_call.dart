import 'package:dio/dio.dart';
import 'package:weather_app/Data/models/Weather_Model.dart';

class ApiCall {
 Future<WeatherModel> getWeatherData(double lat, double lng) async {

      Response response = await Dio().get(
          'http://api.weatherapi.com/v1/forecast.json?key=4889c63a9205421a83b144841222003&q=$lat,$lng&days=7&aqi=no&alerts=no');

      WeatherModel data = WeatherModel.fromJson(response.data);
      return data;
  }
}
