import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/feature/common/presentation/controller/hidden_drawer_controller.dart';
import 'package:housefinder/feature/common/presentation/widgets/hidden_drawer.dart';
import 'package:housefinder/feature/development/screens/development_screen.dart';
import 'package:housefinder/feature/home/presentation/screens/home_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  static const String name = '/';

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int index = 0;

  final List<Widget> _screens =[
    HomeScreen(),
    DevelopmentScreen(appBarTitle: 'Profile'),
    DevelopmentScreen(appBarTitle: 'Location'),
    DevelopmentScreen(appBarTitle: 'Book Mark'),
    DevelopmentScreen(appBarTitle: 'Notification'),
    DevelopmentScreen(appBarTitle: 'Message'),
    DevelopmentScreen(appBarTitle: 'Setting'),
    DevelopmentScreen(appBarTitle: 'Help'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GetBuilder<HiddenDrawerController>(
          builder: (controller) {
            return AppBar(
              toolbarHeight: 1,
              surfaceTintColor:  controller.hiddenDrawerIsVisible
                  ? AppColors.themeColor
                  : Color(0xfffafafa),
              backgroundColor:
                  controller.hiddenDrawerIsVisible
                      ? AppColors.themeColor
                      : Color(0xfffafafa),
            );
          },
        ),
      ),
      body: GetBuilder<HiddenDrawerController>(
        builder: (controller) {
          return Stack(
            children: [
              HiddenDrawer(
                currentIndex: controller.drawerCurrentIndex,
                onItemSelected: (index) {
                  controller.changeIndex(index);
                },
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                left: controller.hiddenDrawerIsVisible == false ? 0 : 221,
                top: controller.hiddenDrawerIsVisible == false ? 0 : 60,
                bottom: controller.hiddenDrawerIsVisible == false ? 0 : 80,
                right: controller.hiddenDrawerIsVisible == false ? 0 : -221,
                child: ClipRRect(
                  borderRadius:
                      controller.hiddenDrawerIsVisible == true
                          ? BorderRadius.circular(17.4)
                          : BorderRadius.circular(0),
                  child: GestureDetector(
                    onTap: controller.hiddenDrawerIsVisible ? () {
                      controller.visibilityToggle();
                    }:null,
                    child: AbsorbPointer(
                        absorbing: controller.hiddenDrawerIsVisible,
                        child: _screens[controller.drawerCurrentIndex]),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
