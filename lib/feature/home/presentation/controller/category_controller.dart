import 'package:get/get.dart';

class CategoryController extends GetxController {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeIndex(int index) {
    _currentIndex = index;
    update();
  }
}
