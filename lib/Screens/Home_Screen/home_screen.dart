import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:weather_app/Controllers/home_controller.dart';
import 'package:weather_app/Screens/Home_Screen/home_components.dart';
import 'package:weather_app/Theme/main_colors.dart';

import '../../../main.dart';
import '../../../objectbox.g.dart';
import '../../models/object_box_model.dart';
import '../../models/weather_model_new.dart';
import '../../utils/api_call.dart';
import '../../utils/page_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? data;
  TextEditingController inputController = TextEditingController();
  bool isLifted = false;

  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    apiData();
  }

  apiData() async {
      Box<WeatherModelObjectBox> weatherData =
          objectBox.store.box<WeatherModelObjectBox>();
      if (weatherData.get(1)!.longitude != 0) {
        data = await Api().getDataByLat(weatherData.get(1)!.latitude,
            weatherData.get(1)!.longitude, context, inputController);
      } else {
        data = await Api()
            .getDataByCity(weatherData.get(1)!.city, context, inputController);
      }
      setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    Size size = MediaQuery.of(context).size;
    Box<WeatherModelObjectBox> weatherData2 =
        objectBox.store.box<WeatherModelObjectBox>();
    return Scaffold(
        body: SafeArea(
      child: controller.isError.value
          ? HomeComponents().errorScreen(size, context)
          : SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  backgroundContainer(size),
                  Column(
                    children: [
                      AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: size.width,
                          height: isLifted ? 80 : size.height * 0.58,
                          child: AnimatedSwitcher(
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                );
                              },
                              duration: const Duration(seconds: 1),
                              child: !isLifted
                                  ? unLiftedWidget(size, weatherData2)
                                  : liftedWidget(weatherData2))),
                      Expanded(
                          child: Stack(
                        children: [
                          bottomSVG(size),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              child: isLifted
                                  ? dayDetails(context, size)
                                  : Column(
                                      key: const Key("2"),
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            forecast(size, 1, weatherData2),
                                            forecast(size, 2, weatherData2),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 30.0),
                                          child: SizedBox(
                                            width: size.width,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons
                                                      .lightAngleDoubleUp,
                                                  color: context.textTheme
                                                      .labelLarge!.color,
                                                ),
                                                Text(
                                                  "Swipe Up for Details",
                                                  style: context
                                                      .textTheme.labelLarge,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            ),
    ));
  }

  Column dayDetails(BuildContext context, Size size) {
    return Column(
      key: const Key("1"),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Average Humidity",
                style: context.textTheme.labelLarge,
              ),
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : "${data!.forecast.forecastday[0].day.avghumidity} %",
                  context.textTheme.labelLarge),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Max Wind Speed",
                style: context.textTheme.labelLarge,
              ),
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : "${data!.forecast.forecastday[0].day.maxwindKph} Kph\n${data!.forecast.forecastday[0].day.maxwindMph} Mph",
                  context.textTheme.labelLarge),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Min Wind Speed",
                style: context.textTheme.labelLarge,
              ),
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : "${data!.forecast.forecastday[0].day.maxwindKph} Kph\n${data!.forecast.forecastday[0].day.maxwindMph} Mph",
                  context.textTheme.labelLarge),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chances Of Rain",
                style: context.textTheme.labelLarge,
              ),
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : "${data!.forecast.forecastday[0].day.dailyChanceOfRain} %",
                  context.textTheme.labelLarge),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chances Of Snow",
                style: context.textTheme.labelLarge,
              ),
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : "${data!.forecast.forecastday[0].day.dailyChanceOfSnow} %",
                  context.textTheme.labelLarge),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Condition Today",
                style: context.textTheme.labelLarge,
              ),
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : data!.forecast.forecastday[0].day.condition.text,
                  context.textTheme.labelLarge),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Precipitation in Mm",
                style: context.textTheme.labelLarge,
              ),
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : data!.forecast.forecastday[0].day.totalprecipMm
                          .toString(),
                  context.textTheme.labelLarge),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Precipitation in In",
                style: context.textTheme.labelLarge,
              ),
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : data!.forecast.forecastday[0].day.totalprecipIn
                          .toString(),
                  context.textTheme.labelLarge),
            ],
          ),
        ),
      ],
    );
  }

/*
        Yb        dP 88 8888b.   dP""b8 888888 888888 .dP"Y8     .dP"Y8 888888  dP""b8 888888 88  dP"Yb  88b 88 .dP"Y8
         Yb  db  dP  88  8I  Yb dP   `" 88__     88   `Ybo."     `Ybo." 88__   dP   `"   88   88 dP   Yb 88Yb88 `Ybo."
          YbdPYbdP   88  8I  dY Yb  "88 88""     88   o.`Y8b     o.`Y8b 88""   Yb        88   88 Yb   dP 88 Y88 o.`Y8b
           YP  YP    88 8888Y"   YboodP 888888   88   8bodP'     8bodP' 888888  YboodP   88   88  YbodP  88  Y8 8bodP'
*/
  GestureDetector bottomSVG(Size size) {
    return GestureDetector(
      onVerticalDragUpdate: (det) {
        if (det.primaryDelta! > 0) {
          setState(() {
            isLifted = false;
          });
        } else {
          setState(() {
            isLifted = true;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: context.theme.backgroundColor,
        ),
      ),
    );
  }

  Column unLiftedWidget(size, weatherData2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: upperRow(size, weatherData2),
        ),
        minAndMaxTemp(size, weatherData2),
        Container()
      ],
    );
  }

  Padding liftedWidget(Box<WeatherModelObjectBox> weatherData2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data == null ? '' : data!.location.name),
          Row(
            children: [
              Text(data == null
                  ? ''
                  : weatherData2.get(1)!.tempInC
                      ? data!.current.tempC.toString()
                      : data!.current.tempF.toString()),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, bottom: 30),
                child: FaIcon(
                  FontAwesomeIcons.circle,
                  size: 10,
                  color: context.textTheme.bodyLarge!.color,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container backgroundContainer(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        MainColors().bg2,
        MainColors().bg2,
        MainColors().bg2,
        MainColors().bg1,
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Opacity(
                opacity: 1,
                child: Image.asset('assets/icons/bg.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row upperRow(Size size, Box<WeatherModelObjectBox> weatherdata) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: mainShimmer(size, data == null ? "" : data!.location.name,
                  context.textTheme.bodyLarge),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Get.toNamed(PageRoutes().settingsSceen, arguments: weatherdata);
            },
            icon: const FaIcon(
              FontAwesomeIcons.lightCog,
              color: Colors.white,
              size: 20,
            )),
      ],
    );
  }

  Shimmer mainShimmer(Size size, String mainData, TextStyle? textStyle) {
    return Shimmer(
        duration: const Duration(seconds: 1),
        color: Colors.grey,
        colorOpacity: 1,
        enabled: data != null ? false : true,
        child: data != null
            ? Text(
                mainData,
                style: textStyle,
              )
            : const SizedBox(
                width: 100,
                height: 50,
              ));
  }

  Column minAndMaxTemp(Size size, Box<WeatherModelObjectBox> weatherData2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 50),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: FaIcon(
                      FontAwesomeIcons.lightLongArrowAltDown,
                      color: context.textTheme.bodyLarge!.color,
                    ),
                  ),
                  Row(
                    children: [
                      mainShimmer(
                          size,
                          data == null
                              ? ""
                              : "${weatherData2.get(1)!.tempInC ? data!.forecast.forecastday[0].day.mintempC : data!.forecast.forecastday[0].day.mintempF}",
                          context.textTheme.bodyLarge),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0, bottom: 20),
                        child: FaIcon(
                          FontAwesomeIcons.circle,
                          size: 10,
                          color: context.textTheme.bodyLarge!.color,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                mainShimmer(
                    size,
                    data == null
                        ? ""
                        : weatherData2.get(1)!.tempInC
                            ? data!.current.tempC.toString()
                            : data!.current.tempF.toString(),
                    context.textTheme.headlineLarge),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 50),
                  child: FaIcon(
                    FontAwesomeIcons.circle,
                    size: 10,
                    color: context.textTheme.headlineLarge!.color,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 50),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: FaIcon(
                      FontAwesomeIcons.lightLongArrowAltUp,
                      color: context.textTheme.headlineLarge!.color,
                    ),
                  ),
                  Row(
                    children: [
                      mainShimmer(
                          size,
                          data == null
                              ? ""
                              : "${weatherData2.get(1)!.tempInC ? data!.forecast.forecastday[0].day.maxtempC : data!.forecast.forecastday[0].day.maxtempF}",
                          context.textTheme.bodyLarge),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0, bottom: 20),
                        child: FaIcon(
                          FontAwesomeIcons.circle,
                          size: 10,
                          color: context.textTheme.headlineLarge!.color,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        mainShimmer(size, data == null ? "" : data!.current.condition.text,
            context.textTheme.bodyLarge),
      ],
    );
  }

  Padding forecast(
      Size size, int num, Box<WeatherModelObjectBox> weatherModel) {
    final dateName = data != null
        ? DateFormat('EEEE').format(DateFormat("yyyy-MM-DD")
            .parse(data == null ? "" : data!.forecast.forecastday[num].date))
        : "Loading...";

    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mainShimmer(
              size, data == null ? "" : dateName, context.textTheme.labelLarge),
          Row(
            children: [
              mainShimmer(
                  size,
                  data == null
                      ? ""
                      : "${weatherModel.get(1)!.tempInC ? data!.forecast.forecastday[num].day.avgtempC : data!.forecast.forecastday[num].day.avgtempF}",
                  context.textTheme.labelLarge),
              Padding(
                padding: const EdgeInsets.only(left: 1.0, bottom: 20),
                child: FaIcon(
                  FontAwesomeIcons.circle,
                  size: 10,
                  color: context.textTheme.labelLarge!.color,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
