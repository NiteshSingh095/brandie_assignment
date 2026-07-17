import 'package:brandie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OriHomeView extends StatelessWidget {
  const OriHomeView({super.key});

  static const String oriHomeId = 'ori_home_view';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OriHomeController>(
      id: oriHomeId,
      initState: (state) {
        if (!Get.isRegistered<OriHomeController>()) {
          OriHomeBindings().dependencies();
        }
      },
      builder: (controller) {
        return Column(
          children: [
            TabBar(
              controller: controller.tabController,
              tabs: controller.tabs,
              overlayColor: WidgetStateProperty.all(Colors.white),
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              labelStyle: TextStyle(
                color: Colors.green,
                fontSize: Dimens.fourteen,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: Dimens.fourteen,
                fontWeight: FontWeight.w700,
              ),
              isScrollable: true,
            ),
            Expanded(
              child: TabBarView(controller: controller.tabController, children: controller.pages),
            ),
          ],
        );
      },
    );
  }
}
