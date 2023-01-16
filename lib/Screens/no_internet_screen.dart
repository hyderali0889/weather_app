import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../utils/page_routes.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "No Internet Connection Available",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const FaIcon(
                FontAwesomeIcons.lightWifiSlash,
                size: 80,
              ),
              InkWell(
                onTap: () {
                  Get.offAllNamed(PageRoutes().homeSceen);
                },
                child: Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.green.shade500,
                      borderRadius: BorderRadius.circular(14.0)),
                  child: Center(
                    child: Text(
                      "Try Again",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
