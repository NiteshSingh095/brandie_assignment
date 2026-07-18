import 'package:get/get.dart';

import 'smart_post_controller.dart';

class SmartPostBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmartPostController>(() => SmartPostController());
  }
}
