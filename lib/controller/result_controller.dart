import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final mathController = TextEditingController();
  final chemController = TextEditingController();
  final phyController = TextEditingController();

  RxBool isPass = true.obs;
  RxString grade = "".obs;
  RxDouble avg = 0.0.obs;

  average() {
    avg.value = ((double.parse(mathController.text) +
            double.parse(chemController.text) +
            double.parse(phyController.text)) /
        3);
  }

  passing() {
    isPass.value = int.parse(mathController.text) > 35 &&
        int.parse(chemController.text) > 35 &&
        int.parse(phyController.text) > 35;
  }

  String grading() {
    if (avg.value > 91 && avg.value <= 100) {
      return grade.value = "A+";
    } else if (avg.value > 81 && avg.value < 90) {
      return grade.value = "A";
    } else if (avg.value > 71 && avg.value < 80) {
      return grade.value = "B+";
    } else if (avg.value > 61 && avg.value < 70) {
      return grade.value = "B";
    } else if (avg.value > 51 && avg.value < 60) {
      return grade.value = "C+";
    } else if (avg.value > 41 && avg.value < 50) {
      return grade.value = "C";
    } else if (avg.value > 36 && avg.value < 40) {
      return grade.value = "D+";
    } else {
      return "F";
    }
  }
}
