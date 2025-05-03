import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/app/controller_binder.dart';
import 'package:housefinder/feature/common/presentation/screens/main_menu_screen.dart';
import 'package:housefinder/feature/home/data/model/house_data_model.dart';
import 'package:housefinder/feature/home/presentation/screens/home_screen.dart';
import 'package:housefinder/feature/house%20details/presentation/screens/house_details_screen.dart';

class HouseFinderApp extends StatelessWidget {
  const HouseFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'House Finder',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Color(0xfffafafa),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xfffafafa))
      ),
     initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget route;
        if (settings.name == MainMenuScreen.name) {
        route = const MainMenuScreen();
        } else if (settings.name == HouseDetailsScreen.name) {
        HouseDataModel model = settings.arguments as HouseDataModel;
        route = HouseDetailsScreen(houseDataModel: model);
        }
        return MaterialPageRoute(
          builder: (context) {
            return route;
          },
        );
      },
    );
  }
}
