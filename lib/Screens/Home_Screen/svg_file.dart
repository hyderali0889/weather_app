//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:weather_app/Theme/main_colors.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6702899, size.height * -0.001369863);
    path_0.cubicTo(
        size.width * 0.6952488,
        size.height * -0.001369863,
        size.width * 0.7202101,
        size.height * -0.001369863,
        size.width * 0.7451691,
        size.height * -0.001369863);
    path_0.cubicTo(
        size.width * 0.8295556,
        size.height * 0.02553707,
        size.width * 0.9140966,
        size.height * 0.05293425,
        size.width * 0.9987923,
        size.height * 0.08082192);
    path_0.cubicTo(
        size.width * 0.9987923,
        size.height * 0.3867589,
        size.width * 0.9987923,
        size.height * 0.6926932,
        size.width * 0.9987923,
        size.height * 0.9986301);
    path_0.cubicTo(
        size.width * 0.6654589,
        size.height * 0.9986301,
        size.width * 0.3321256,
        size.height * 0.9986301,
        size.width * -0.001207729,
        size.height * 0.9986301);
    path_0.cubicTo(
        size.width * -0.001207729,
        size.height * 0.6698630,
        size.width * -0.001207729,
        size.height * 0.3410959,
        size.width * -0.001207729,
        size.height * 0.01232877);
    path_0.cubicTo(
        size.width * 0.07583164,
        size.height * 0.03554438,
        size.width * 0.1531263,
        size.height * 0.05791890,
        size.width * 0.2306763,
        size.height * 0.07945205);
    path_0.cubicTo(
        size.width * 0.2957005,
        size.height * 0.09077671,
        size.width * 0.3601135,
        size.height * 0.08712384,
        size.width * 0.4239130,
        size.height * 0.06849315);
    path_0.cubicTo(
        size.width * 0.4692850,
        size.height * 0.05499205,
        size.width * 0.5143720,
        size.height * 0.04038000,
        size.width * 0.5591787,
        size.height * 0.02465753);
    path_0.cubicTo(
        size.width * 0.5961401,
        size.height * 0.01362704,
        size.width * 0.6331763,
        size.height * 0.004951260,
        size.width * 0.6702899,
        size.height * -0.001369863);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color =
        SchedulerBinding.instance.window.platformBrightness == Brightness.dark
            ? MainColors().backgroundBlack
            : MainColors().backgroundWhite;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
