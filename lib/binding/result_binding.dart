import 'package:get/get.dart';
import 'package:revisionproject/controller/result_controller.dart';

class ResultBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(() => ResultController());
    // TODO: implement dependencies
  }
}