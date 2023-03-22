import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString outputResult = "".obs;
  RxBool isDisable = false.obs;

  numberPress(String num) {
    outputResult.value += num;
  }

  clearPress() {
    if (outputResult.isNotEmpty) {
      outputResult.value =
          outputResult.substring(0, outputResult.value.length - 1);
    }
  }

  bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  separate() {
    RxString num1 = "".obs;
    RxString num2 = "".obs;
    String opp = "";

    RxBool isNumber = true.obs;
    for (int i = 0; i < outputResult.value.length; i++) {
      if (isNumeric(outputResult.value[i])) {
        if (isNumber.value) {
          num1.value += outputResult.value[i];
        } else {
          num2.value += outputResult.value[i];
        }
      } else {
        isNumber = false.obs;
        opp += outputResult.value[i];
      }
    }
    outputResult.value = operation(num1, num2, opp);
  }

  String operation(RxString num1, RxString num2, opp) {
    switch (opp) {
      case "+":
        return (int.parse(num1.value) + int.parse(num2.value)).toString();

      case "-":
        return (int.parse(num1.value) - int.parse(num2.value)).toString();

      case "*":
        return (int.parse(num1.value) * int.parse(num2.value)).toString();

      case "/":
        return (int.parse(num1.value) / int.parse(num2.value)).toString();

      default:
        return "0";
    }
  }
}
