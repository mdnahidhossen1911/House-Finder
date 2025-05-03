import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:housefinder/app/assets_path.dart';
import 'package:housefinder/app/fonts.dart';
import 'package:housefinder/feature/home/data/model/house_data_model.dart';

class NearFromYouCard extends StatelessWidget {
  final HouseDataModel houseDataModel;
  const NearFromYouCard({
    super.key, required this.houseDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 271,
      width: 221,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 10,
            spreadRadius: -13,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 272,
            width: 222,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                houseDataModel.image??'',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
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
            child: Stack(
              children: [
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0x3D000000),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetsPath.icLocation,
                          height: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          houseDataModel.distance??'',
                          style: TextStyle(
                            fontFamily: Fonts.raleway,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        houseDataModel.title??'',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: Fonts.raleway,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        houseDataModel.subtitle??'',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Fonts.raleway,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
