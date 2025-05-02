import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/app/controller_binder.dart';
import 'package:housefinder/feature/common/presentation/screens/main_menu_screen.dart';

class HouseFinderApp extends StatelessWidget {
  const HouseFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'House Finder',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      initialRoute: MainMenuScreen.name,
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Color(0xfffafafa),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xfffafafa))
      ),
      getPages: [
        GetPage(name: MainMenuScreen.name, page: () => const MainMenuScreen())
      ],
    );
  }
}
