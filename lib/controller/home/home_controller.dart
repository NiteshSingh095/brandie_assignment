import 'package:brandie/core/constants/constants.dart';
import 'package:brandie/shared/enums.dart';
import 'package:brandie/views/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Selected index for the bottom navigation bar
  int selectedIndex = BottomNavigationEnum.oriHome.index;

  /// Pages for the bottom navigation bar
  final List<Widget> pages = [
    const NotificationView(),
    const SearchView(),
    const OriHomeView(),
    const MessagesView(),
    const ProfileView(),
  ];

  /// Bottom navigation items
  final List<NavigationDestination> bottomNavigationItems = [
    NavigationDestination(
      icon: SvgPicture.asset(AssetConstants.notifications),
      selectedIcon: SvgPicture.asset(
        AssetConstants.notifications,
        colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
      ),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(AssetConstants.search),
      selectedIcon: SvgPicture.asset(
        AssetConstants.search,
        colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
      ),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(AssetConstants.home),
      selectedIcon: SvgPicture.asset(
        AssetConstants.home,
        colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
      ),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(AssetConstants.messages),
      selectedIcon: SvgPicture.asset(
        AssetConstants.messages,
        colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
      ),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(AssetConstants.profile),
      selectedIcon: SvgPicture.asset(
        AssetConstants.profile,
        colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
      ),
      label: '',
    ),
  ];

  /// Change the index of the bottom navigation bar
  void changeIndex(int index) {
    selectedIndex = index;
    update([BottomNavigation.bottomNavigationId, HomeView.homedId]);
  }
}
