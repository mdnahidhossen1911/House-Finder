import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white)
      ),
      getPages: [
        GetPage(name: MainMenuScreen.name, page: () => const MainMenuScreen())
      ],
    );
  }
}
