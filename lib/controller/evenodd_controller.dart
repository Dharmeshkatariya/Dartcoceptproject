import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EvenOddController extends GetxController {
  RxString outputResult = "0".obs;
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  evenCheck(num1Controller, num2Controller) {
    if (num1Controller.text.isNotEmpty && num2Controller.text.isNotEmpty) {
      outputResult.value = '';

      for (int i = int.parse(num1Controller.text);
          i < int.parse(num2Controller.text);
          i++) {
        if (i % 2 == 0) {
          outputResult.value += '$i, ';
        }
      }
    }
  }

  oddCheck(num1Controller, num2Controller) {
    if (num1Controller.text.isNotEmpty && num2Controller.text.isNotEmpty) {
      outputResult.value = '';
      for (int a = int.parse(num1Controller.text);
          a < int.parse(num2Controller.text);
          a++) {
        if (a % 2 != 0) {
          outputResult.value += '$a, ';
        }
      }
    }
  }
}
