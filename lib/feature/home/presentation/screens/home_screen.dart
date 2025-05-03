import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/app/assets_path.dart';
import 'package:housefinder/app/fonts.dart';
import 'package:housefinder/feature/common/presentation/controller/hidden_drawer_controller.dart';
import 'package:housefinder/feature/home/data/model/house_data_model.dart';
import 'package:housefinder/feature/home/data/near_for_you_data.dart';
import 'package:housefinder/feature/home/presentation/widgets/near_from_vou_card.dart';

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
  List<HouseDataModel> nearFromYouList =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      dropdownValue = list.first;
    nearFromYouList = NearForYouData.map((e) => HouseDataModel.fromJson(e)).toList();
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
            _buildTapBarSection(),
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
              itemCount: 4,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            AssetsPath.house1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dreamsville House',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.raleway,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Rp. 2.500.000.000 / Year',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Fonts.raleway,
                              color: AppColors.themeColor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset(AssetsPath.icBad),
                              SizedBox(width: 6),
                              Text(
                                '6 Bedroom',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: Fonts.raleway,
                                  color: Color(0xFF858585),
                                ),
                              ),
                              SizedBox(width: 16),
                              SvgPicture.asset(AssetsPath.icBath),
                              SizedBox(width: 6),
                              Text(
                                '4 Bathroom',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: Fonts.raleway,
                                  color: Color(0xFF858585),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
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
            onPressed: () {},
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _tapbarIndex == index ? null : Color(0xfff7f7f7),
                gradient:
                    _tapbarIndex == index
                        ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.whiteBlue, AppColors.themeColor],
                        )
                        : null,
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

