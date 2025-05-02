import 'package:housefinder/app/assets_path.dart';

class DrawerItemData {
  static List<Map<String, dynamic>> drawerItems = [
    {'title': 'Home', 'icon': AssetsPath.icHome, 'index': 0, 'badge': false},
    {
      'title': 'Profile',
      'icon': AssetsPath.icProfile,
      'index': 1,
      'badge': false,
    },
    {
      'title': 'Location',
      'icon': AssetsPath.icLocation,
      'index': 2,
      'badge': false,
    },
    {'isdivider': true},
    {
      'title': 'Bookmark',
      'icon': AssetsPath.icBookMark,
      'index': 3,
      'badge': false,
    },
    {
      'title': 'Notification',
      'icon': AssetsPath.icNotification,
      'index': 4,
      'badge': true,
    },
    {
      'title': 'Message',
      'icon': AssetsPath.icMessage,
      'index': 5,
      'badge': true,
    },
    {'isdivider': true},
    {
      'title': 'Setting',
      'icon': AssetsPath.icSetting,
      'index': 6,
      'badge': false,
    },
    {'title': 'Help',
      'icon': AssetsPath.icHelp,
      'index': 7,
      'badge': false,
    },
    {
      'title': 'Logout',
      'icon': AssetsPath.icLogout,
      'index': 8,
      'badge': false,
    },
  ];
}
