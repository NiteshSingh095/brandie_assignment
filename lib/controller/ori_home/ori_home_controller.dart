import 'package:brandie/main.dart';
import 'package:brandie/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OriHomeController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;

  /// Pages for the tab bar
  final List<Widget> pages = [
    const SmartPostView(),
    const LibraryView(),
    const CommunitiesView(),
    const ShareAndWinView(),
  ];

  /// Tabs for the tab bar
  final List<Tab> tabs = OriHomeTabEnum.values
      .map((tab) => Tab(text: tab.label.tr))
      .toList();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: OriHomeTabEnum.values.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
