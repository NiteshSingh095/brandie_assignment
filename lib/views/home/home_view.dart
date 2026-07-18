import 'package:brandie/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String homedId = 'home_view';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: homedId,
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          appBar: const HomeAppBar(),
          bottomNavigationBar: const BottomNavigation(),
          body: controller.pages[controller.selectedIndex],
        );
      },
    );
  }
}
