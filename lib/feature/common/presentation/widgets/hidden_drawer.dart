import 'package:flutter/material.dart';
import 'package:housefinder/app/app_color.dart';
import 'package:housefinder/feature/common/data/drawer_item_data.dart';

import 'hidden_drawer_item.dart';

class HiddenDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onItemSelected;

  const HiddenDrawer({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.themeColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: DrawerItemData.drawerItems.map((item) {
          if (item['isdivider'] == true) {
            return  SizedBox(
                width: 165,
                child: Divider(color: AppColors.whiteBlue),
            );
          }

          return HiddenDrawerItem(
            currentIndex: currentIndex,
            itemIndex: item['index'],
            title: item['title'],
            icon: item['icon'],
            badge: item['badge'] ?? false,
            onTab: () {
              if(item['index'] ==8){
                return null;
              }
              onItemSelected(item['index']);
            },
          );
        }).toList(),
      ),
    );
  }
}
