import 'package:brandie/controller/edit_caption/edit_caption.dart';
import 'package:brandie/views/home/home.dart';
import 'package:brandie/views/ori_home/smart_post/edit_caption/edit_caption.dart';
import 'package:get/get.dart';

import 'app_route.dart';

class AppPages {
  const AppPages._();

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.editCaption,
      page: () => const EditCaptionView(),
      binding: EditCaptionBindings(),
    ),
  ];
}
