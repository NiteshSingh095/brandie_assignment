import 'package:get/get.dart';
import 'ori_home_controller.dart';

class OriHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OriHomeController>(() => OriHomeController());
  }
}