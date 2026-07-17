import 'package:brandie/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  static const String bottomNavigationId = 'bottom_navigation';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: bottomNavigationId,
      builder: (controller) {
        return NavigationBar(
          selectedIndex: controller.selectedIndex,
          onDestinationSelected: controller.changeIndex,
          destinations: controller.bottomNavigationItems,
          backgroundColor: Colors.black,
        );
      },
    );
  }
}
