import 'package:get/get.dart';

class HiddenDrawerController extends GetxController{
  int _drawerCurrentIndex = 0;
  bool _hiddenDrawerIsVisible = false;

  int get drawerCurrentIndex => _drawerCurrentIndex;
  bool get hiddenDrawerIsVisible => _hiddenDrawerIsVisible;

  changeIndex(int index){
    _drawerCurrentIndex = index;
    update();
    visibilityToggle();
  }

  visibilityToggle(){
    if(_hiddenDrawerIsVisible ==true){
      _hiddenDrawerIsVisible = false;
    }else{
      _hiddenDrawerIsVisible = true;
    }
    update();
  }

}