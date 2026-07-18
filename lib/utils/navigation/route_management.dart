import 'package:get/get.dart';

import 'app_route.dart';

class RouteManagement {
  const RouteManagement._();

  /// Edit caption route
  static void toEditCaption(String postId) {
    Get.toNamed(AppRoutes.editCaption, arguments: postId);
  }

  /// Back route
  static void back() {
    Get.back();
  }
}
