import 'package:flutter/material.dart';


class HomeComponents {
  Container errorScreen(size , context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.red.shade300,

      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "An Error Occurred While Searching for Your Data",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Image.asset(
              'assets/icons/error.png',
              width: 200,
              height: 200,
            ),
            Container()
          ]),
    );
  }
}
