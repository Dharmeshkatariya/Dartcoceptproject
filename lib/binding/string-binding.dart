import 'package:get/get.dart';
import 'package:revisionproject/controller/string_controller.dart';

class StrScreenPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StringController>(() => StringController());
    // TODO: implement dependencies
  }

}