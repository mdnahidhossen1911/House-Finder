import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/app/assets_path.dart';
import 'package:housefinder/app/fonts.dart';
import 'package:housefinder/feature/home/data/model/house_data_model.dart';
import 'package:housefinder/feature/house%20details/data/galleryList.dart';
import 'package:housefinder/feature/house%20details/presentation/widget/owner_card.dart';
import 'package:readmore/readmore.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCoverImage(),
                    SizedBox(height: 12),
                    _sectionTitle('Description'),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ReadMoreText(
                        widget.houseDataModel.description ?? '',
                        trimMode: TrimMode.Line,
                        trimLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Fonts.raleway,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff858585),
                        ),
                        colorClickableText: AppColors.themeColor,
                        trimCollapsedText: 'Show More',
                        trimExpandedText: 'Show Less',
                        moreStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: Fonts.raleway,
                          fontWeight: FontWeight.w500,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    OwnerCard(),
                    SizedBox(height: 26),
                    _sectionTitle('Gallery'),
                    SizedBox(height: 16),
                    _buildHouseGallery(),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(AssetsPath.map),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomPriceBar(),
        ],
      ),
    );
  }

  SafeArea _buildBottomPriceBar() {
    return SafeArea(
      child: Container(
        height: 64,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xfffafafa),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: Fonts.raleway,
                      color: Color(0xff858585),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Rp. ${widget.houseDataModel.price} / Year',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: Fonts.raleway,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 44,
              margin: EdgeInsets.symmetric(horizontal: 6),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.whiteBlue, AppColors.themeColor],
                ),
              ),
              child: Center(
                child: Text(
                  'Rent Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Fonts.raleway,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontFamily: Fonts.raleway,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildHouseGallery() {
    return SizedBox(
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: galleryList.length <= 4 ? galleryList.length : 4,
        itemBuilder: (context, index) {
          if (galleryList.length > 4 && index == 3) {
            return Stack(
              children: [
                _buildGalleryImage(AssetsPath.gallery4),
                Container(
                  height: 72,
                  width: 72,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x4d000000),
                  ),
                  child: Text(
                    '+5',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: Fonts.raleway,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return _buildGalleryImage(galleryList[index]);
          }
        },
      ),
    );
  }

  Widget _buildGalleryImage(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 72,
        width: 72,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildCoverImage() {
    return Padding(
      padding: const EdgeInsets.all(10),
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
                    Color(0xB3000000),
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
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                    size: 16,
                  ),
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
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.houseDataModel.title ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: Fonts.raleway,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.houseDataModel.subtitle ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: Fonts.raleway,
                      color: Color(0xffd4d4d4),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0x33FFFFFF),
                        ),
                        child: SvgPicture.asset(
                          AssetsPath.icBad,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${widget.houseDataModel.badCount} Bedroom',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Fonts.raleway,
                          color: Color(0xFFD4D4D4),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0x33FFFFFF),
                        ),
                        child: SvgPicture.asset(
                          AssetsPath.icBath,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${widget.houseDataModel.bathCount} Bathroom',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Fonts.raleway,
                          color: Color(0xFFD4D4D4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
