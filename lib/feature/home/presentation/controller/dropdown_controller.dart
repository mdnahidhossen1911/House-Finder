import 'package:get/get.dart';

class DropdownController extends GetxController {
  String _value = '';

  String get value => _value;

  changeValue(String value) {
    _value = value;
    update();
  }
}
