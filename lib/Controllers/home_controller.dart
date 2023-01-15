import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isError = false.obs;

  RxBool isinC = true.obs;

  void addError(bool val) {
    isError.value = val;
  }

  void changeSystem(bool val) {
    isinC.value = val;
  }
}
