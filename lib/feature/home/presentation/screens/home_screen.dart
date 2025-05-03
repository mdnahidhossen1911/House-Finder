import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/app/assets_path.dart';
import 'package:housefinder/app/fonts.dart';
import 'package:housefinder/feature/common/presentation/controller/hidden_drawer_controller.dart';
import 'package:housefinder/feature/home/data/best_for_you_data.dart';
import 'package:housefinder/feature/home/data/category_list.dart';
import 'package:housefinder/feature/home/data/drop_down_list.dart';
import 'package:housefinder/feature/home/data/model/house_data_model.dart';
import 'package:housefinder/feature/home/data/near_for_you_data.dart';
import 'package:housefinder/feature/home/presentation/controller/category_controller.dart';
import 'package:housefinder/feature/home/presentation/controller/dropdown_controller.dart';
import 'package:housefinder/feature/home/presentation/widgets/best_for_you_card.dart';
import 'package:housefinder/feature/home/presentation/widgets/near_from_vou_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoryController _categoryController = CategoryController();
  final DropdownController _dropdownController = DropdownController();

  List<HouseDataModel> nearFromYouList = [];
  List<HouseDataModel> bestForYouList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownController.changeValue(dropDownList.first);
    nearFromYouList =
        nearForYouData.map((e) => HouseDataModel.fromJson(e)).toList();
    bestForYouList =
        bestForYouData.map((e) => HouseDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildSearchBar(),
            SizedBox(height: 16),
            _buildCategory(),
            SizedBox(height: 20),
            _buildSectionTitle('Near from you'),
            SizedBox(
              height: 291,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: nearFromYouList.length,
                itemBuilder: (context, index) {
                  return NearFromYouCard(
                    houseDataModel: nearFromYouList[index],
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            _buildSectionTitle('Best for you'),
            ListView.builder(
              itemCount: bestForYouList.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BestForYouCard(houseDataModel: bestForYouList[index]);
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {VoidCallback? onTab}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: Fonts.raleway,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: onTab,
            child: Text(
              'See more',
              style: TextStyle(
                fontFamily: Fonts.raleway,
                color: Color(0xff858585),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildCategory() {
    return SizedBox(
      height: 36,
      child: GetBuilder(
        init: _categoryController,
        builder: (controller) {
          return ListView.builder(
            itemCount: categoryList.length,
            padding: EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.changeIndex(index);
                },
                child: Container(
                  height: 48,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        controller.currentIndex == index
                            ? null
                            : Color(0xfff7f7f7),
                    gradient:
                        controller.currentIndex == index
                            ? LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.whiteBlue,
                                AppColors.themeColor,
                              ],
                            )
                            : null,
                  ),
                  child: Center(
                    child: Text(
                      categoryList[index],
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: Fonts.raleway,
                        fontWeight: FontWeight.w500,
                        color:
                            controller.currentIndex == index
                                ? Colors.white
                                : Color(0xff858585),
                      ),
                    ),
                  ),
                ),
              );
            },
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
      forceMaterialTransparency: true,
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
              height: 21,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  DropdownButtonHideUnderline _locationDropdown() {
    return DropdownButtonHideUnderline(
      child: GetBuilder(
        init: _dropdownController,
        builder: (controller) {
          return SizedBox(
            height: 30,
            child: DropdownButton<String>(
              value: controller.value,
              dropdownColor: Colors.white,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: Fonts.raleway,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (String? value) {
                controller.changeValue(value!);
              },
              items:
                  dropDownList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
          );
        },
      ),
    );
  }
}
