import 'package:get/get.dart';
import 'package:getxdemo/presentation/controllers/homeController.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
