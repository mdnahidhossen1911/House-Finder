import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/app/fonts.dart';

class HiddenDrawerItem extends StatelessWidget {
  final VoidCallback? onTab;
  final int currentIndex;
  final int itemIndex;
  final String icon;
  final String title;
  final bool? badge;

  const HiddenDrawerItem({
    super.key,
    required this.currentIndex,
    required this.itemIndex,
    required this.icon,
    this.badge,
    required this.title,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 165,
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: currentIndex == itemIndex ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 24),
            badge == true
                ? Badge(
              backgroundColor: Colors.red,
              child: SvgPicture.asset(
                icon,
                color:
                currentIndex == itemIndex
                    ? AppColors.themeColor
                    : Colors.white,
              ),
            )
                : SvgPicture.asset(
              icon,
              color:
              currentIndex == itemIndex
                  ? AppColors.themeColor
                  : Colors.white,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontFamily: Fonts.raleway,
                color:
                currentIndex == itemIndex
                    ? AppColors.themeColor
                    : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
