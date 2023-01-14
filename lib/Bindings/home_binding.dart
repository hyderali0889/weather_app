import 'package:get/get.dart';
import 'package:weather_app/Controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => HomeController());
  }
}
