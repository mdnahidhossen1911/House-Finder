import 'package:get/get.dart';
import 'package:housefinder/feature/common/presentation/controller/hidden_drawer_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(HiddenDrawerController());
  }
}