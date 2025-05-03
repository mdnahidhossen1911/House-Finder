import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housefinder/feature/home/data/model/house_data_model.dart';

class HouseDetailsScreen extends StatefulWidget {
  final HouseDataModel houseDataModel;

  const HouseDetailsScreen({super.key, required this.houseDataModel});

  static String name = '/HomeDetailsScreen';

  @override
  State<HouseDetailsScreen> createState() => _HouseDetailsScreenState();
}

class _HouseDetailsScreenState extends State<HouseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, forceMaterialTransparency: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 304,
            width: double.maxFinite,
            child: Stack(
              children: [
                SizedBox(
                  height: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget.houseDataModel.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Color(0x610d0d0d),
                        Color(0x99000000),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Color(0x3D000000),
                    radius: 18,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 16,),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Color(0x3D000000),
                    radius: 18,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_border,color: Colors.white,size: 19,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
