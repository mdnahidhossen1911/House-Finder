import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/fonts.dart';
import 'package:housefinder/feature/common/presentation/controller/hidden_drawer_controller.dart';

class DevelopmentScreen extends StatefulWidget {
  final String appBarTitle;
  const DevelopmentScreen({super.key, required this.appBarTitle});

  @override
  State<DevelopmentScreen> createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
          style: TextStyle(
            fontFamily: Fonts.raleway,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        leading: IconButton(onPressed: () {
          Get.find<HiddenDrawerController>().visibilityToggle();
        }, icon: Icon(Icons.menu)),
      ),
      body: Center(
        child: Text(
          'Comming Soon...',
          style: TextStyle(
            fontFamily: Fonts.raleway,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
