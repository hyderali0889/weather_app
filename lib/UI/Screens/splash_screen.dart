import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:location/location.dart' as locate;
import 'package:weather_app/UI/Screens/home_screen.dart';
import '../../Data/models/object_box_model.dart';
import '../../Data/utils/api_call.dart';
import '../../Data/models/Weather_Model.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  locate.Location location = locate.Location();
  late bool _serviceEnabled;
  late locate.PermissionStatus _permissionGranted;
  late locate.LocationData _locationData;
  late WeatherModel data;
  late AnimationController _controller;
  late Animation sizeAnimation;
  @override
  void initState() {
    super.initState();
    animation();
    getLoc();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function for Animations

  void animation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        if (_controller.isCompleted) {
          _controller.repeat();
        }
      });
    sizeAnimation = TweenSequence(<TweenSequenceItem>[
      TweenSequenceItem<double>(
          tween: Tween(begin: 400.0, end: 380.0), weight: 150),
      TweenSequenceItem<double>(
          tween: Tween(begin: 380.0, end: 400.0), weight: 150),
    ]).animate(_controller);
    _controller.forward();
  }

//  Function for getting Location

  void getLoc() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == locate.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != locate.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    //Function Call to Get  Api Data

    getApiData();
  }

  //Function to get API Data

  void getApiData() async {
    Box<WeatherModelObjectBox> weatherData =
        objectBox.store.box<WeatherModelObjectBox>();

    data = await ApiCall().getWeatherData(_locationData.latitude!.toDouble(),
        _locationData.longitude!.toDouble());

    var themeMode = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = themeMode == Brightness.dark;

    WeatherModelObjectBox model = WeatherModelObjectBox(
        tempC1: data.current.tempC.toInt(),
        tempC2: data.forecast.forecastday[1].day.avgtempC.toInt(),
        tempC3: data.forecast.forecastday[2].day.avgtempC.toInt(),
        theme: isDarkMode ? 'dark' : 'light');

    weatherData.put(model);

    if (!mounted) return;

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }

  //Main Build

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: sizeAnimation,
                builder: ((context, child) {
                  return Image.asset(
                    'assets/icons/main.png',
                    width: sizeAnimation.value,
                  );
                }),
              )
            ]),
      )),
    );
  }
}
