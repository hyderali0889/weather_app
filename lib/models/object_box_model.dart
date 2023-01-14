import 'package:objectbox/objectbox.dart';

@Entity()
class WeatherModelObjectBox {
  int id;
  final int latitude;
  final int longitude;
  final String city;
  final bool tempInC;
  final String theme;

  WeatherModelObjectBox
  ({
    required this.city,
      required this.latitude,
     required  this.longitude,
     required  this.tempInC,
     required  this.theme ,
      this.id = 0}

       );
}
