import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:housefinder/app/assets_path.dart';
import 'package:housefinder/app/fonts.dart';

class OwnerCard extends StatelessWidget {
  const OwnerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xcc8198ac),
            backgroundImage: AssetImage(AssetsPath.owner),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Garry Allen',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Fonts.raleway,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Owner',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Fonts.raleway,
                    color: Color(0xff858585),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0x800A8ED9),
            ),
            child: SvgPicture.asset(AssetsPath.icCall),
          ),
          SizedBox(width: 16),
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0x800A8ED9),
            ),
            child: SvgPicture.asset(AssetsPath.icSms),
          ),
        ],
      ),
    );
  }
}
