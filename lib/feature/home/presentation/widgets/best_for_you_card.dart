import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/app/assets_path.dart';
import 'package:housefinder/app/fonts.dart';
import 'package:housefinder/feature/home/data/model/house_data_model.dart';
import 'package:housefinder/feature/house%20details/presentation/screens/house_details_screen.dart';

class BestForYouCard extends StatelessWidget {
  final HouseDataModel houseDataModel;
  const BestForYouCard({
    super.key, required this.houseDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(HouseDetailsScreen.name,arguments: houseDataModel);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image.asset(
                  houseDataModel.image??'',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  houseDataModel.title??'',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Fonts.raleway,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Rp. ${houseDataModel.price} / Year',
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
                      '${houseDataModel.badCount} Bedroom',
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
                      '${houseDataModel.bathCount} Bathroom',
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
      ),
    );
  }
}
