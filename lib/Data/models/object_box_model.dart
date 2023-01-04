import 'package:objectbox/objectbox.dart';

@Entity()
class WeatherModelObjectBox {
  int id;
  final int tempC1;
  final int tempC2;
  final int tempC3;

  final String theme;

  WeatherModelObjectBox(
      {required this.tempC1,
      required this.tempC2,
      required this.tempC3,
      this.id = 0,
    required  this.theme});
}
