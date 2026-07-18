import 'package:get/get.dart';

import 'edit_caption_controller.dart';

class EditCaptionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCaptionController>(() => EditCaptionController());
  }
}
