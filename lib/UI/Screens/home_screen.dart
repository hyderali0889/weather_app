import 'package:flutter/material.dart';
import '../../Data/models/object_box_model.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key });



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
      Box<WeatherModelObjectBox> weatherData =
        objectBox.store.box<WeatherModelObjectBox>();

    return Scaffold(body: Column(
      children: [Text(
      weatherData.get(1)!.tempC1.toString()
       )],
     ));
  }
}
