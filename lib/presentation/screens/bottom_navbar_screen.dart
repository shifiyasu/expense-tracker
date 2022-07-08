import 'package:expense_tracker/data/colors.dart';
import 'package:expense_tracker/presentation/screens/add_new_record_screen.dart';
import 'package:expense_tracker/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const HomeScreen(),
      const AddNewRecordScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Boxicons.bx_home_smile),
        title: ("Home"),
        activeColorPrimary: kPrimaryGreen,
        inactiveColorPrimary: kDarkGray,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Boxicons.bx_bar_chart),
        title: ("Stats"),
        activeColorPrimary: kPrimaryGreen,
        inactiveColorPrimary: kDarkGray,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Boxicons.bx_plus,
          color: kWhite,
        ),
        title: ("Add"),
        activeColorPrimary: kPrimaryGreen,
        inactiveColorPrimary: kDarkGray,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Boxicons.bx_wallet),
        title: ("Budget"),
        activeColorPrimary: kPrimaryGreen,
        inactiveColorPrimary: kDarkGray,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Boxicons.bx_book_bookmark),
        title: ("Articles"),
        activeColorPrimary: kPrimaryGreen,
        inactiveColorPrimary: kDarkGray,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: kWhite, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: kWhite,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
