import 'package:get/get.dart';
import 'package:revisionproject/controller/calculator_controller.dart';

class CalculatorBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CalculatorController>(() => CalculatorController());
  }

}