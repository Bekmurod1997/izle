import 'package:get/get.dart';

class PageNavigationController extends GetxController {
  var pageControler = 0.obs;
  var tabIndex = 0.obs;

  void pageControllerChanger(var value) {
    pageControler.value = value;
  }

  void tabIndexChanger(var value) {
    tabIndex.value = value;
  }
}
