import 'package:get/get.dart';


class HomeController extends GetxController {
  RxBool isError = false.obs;


  RxBool isLifted = false.obs;

  void addError(bool val) {
    isError.value = val;
  }




}
