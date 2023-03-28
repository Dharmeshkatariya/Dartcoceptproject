import 'package:get/get.dart';
import 'package:revisionproject/controller/evenodd_controller.dart';

class EvenOddBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<EvenOddController>(() => EvenOddController());
    // TODO: implement dependencies
  }
}