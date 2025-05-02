import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/app/assets_path.dart';
import 'package:housefinder/app/fonts.dart';
import 'package:housefinder/feature/common/presentation/controller/hidden_drawer_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> list = <String>['Jakarta', 'Dubai', 'Dhaka'];
  List<String> tabBar = ['House', 'Apartment', 'Hotel', 'Villa', 'Cottage'];
  late String dropdownValue;
  int _tapbarIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildSearchBar(),
          SizedBox(height: 16),
          _buildTapBarSection(),
          SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Near from you',style: TextStyle(),),
              Text('data'),
            ],),
          )
        ],
      ),
    );
  }

  SizedBox _buildTapBarSection() {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        itemCount: tabBar.length,
        padding: EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _tapbarIndex = index;
              setState(() {});
            },
            child: Container(
              height: 48,
              margin: EdgeInsets.symmetric(horizontal: 6),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _tapbarIndex == index ? null : Color(0xfff7f7f7),
                gradient:
                    _tapbarIndex == index
                        ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.whiteBlue, AppColors.themeColor],
                        ) : null
              ),
              child: Center(
                child: Text(
                  tabBar[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Fonts.raleway,
                    fontWeight: FontWeight.w500,
                    color:
                        _tapbarIndex == index
                            ? Colors.white
                            : Color(0xff858585),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Row _buildSearchBar() {
    return Row(
      children: [
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              prefixIcon: Icon(Icons.search, color: Color(0xff838383)),
              hintText: 'Search address, or near you',
              hintStyle: TextStyle(
                fontFamily: Fonts.raleway,
                fontSize: 12,
                color: Color(0xff858585),
              ),
              fillColor: Color(0xfff7f7f7),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 48,
            height: 48,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.whiteBlue, AppColors.themeColor],
              ),
            ),
            child: SvgPicture.asset(AssetsPath.icFilter),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            'Location',
            style: TextStyle(
              fontFamily: Fonts.raleway,
              fontSize: 12,
              color: Color(0xff838383),
            ),
          ),
          _locationDropdown(),
        ],
      ),
      leading: IconButton(
        onPressed: () {
          Get.find<HiddenDrawerController>().visibilityToggle();
        },
        icon: Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            child: SvgPicture.asset(
              AssetsPath.icNotification,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  DropdownButtonHideUnderline _locationDropdown() {
    return DropdownButtonHideUnderline(
      child: SizedBox(
        height: 30,
        child: DropdownButton<String>(
          value: dropdownValue,
          dropdownColor: Colors.white,
          icon: const Icon(Icons.arrow_drop_down_outlined),
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: Fonts.raleway,
            fontWeight: FontWeight.w500,
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items:
              list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
        ),
      ),
    );
  }
}
