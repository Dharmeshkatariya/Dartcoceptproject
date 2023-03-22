import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StringController extends GetxController {
  RxString outputResult = "".obs;

  RxBool isVisible = false.obs;
  final s1Controller = TextEditingController();
  final s2Controller = TextEditingController();

  addString() {
    isVisible.value = true;
    if (s2Controller.text.isNotEmpty) {
      outputResult.value = s1Controller.text + s2Controller.text;
    }
  }

  firstChar() {
    if (s1Controller.text.length > 5) {
      outputResult.value = s1Controller.text.substring(0, 5);
    }
  }

  realInput() {
    var array = outputResult.split(",");
    outputResult.value = array.join();
  }

  commaSeparate() {
    if (s1Controller.text.isNotEmpty) outputResult.value = "";
    String result = s1Controller.text.toUpperCase();

    for (int i = 0; i < result.length; i++) {
      outputResult.value += "${result[i]},";
    }
  }

  lastChar() {
    if (s1Controller.text.length > 5) {
      outputResult.value =
          s1Controller.text.substring(s1Controller.text.length - 5);
    }
  }
}
