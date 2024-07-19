import 'package:get/get.dart';
import 'package:getxdemo/presentation/controllers/cartController.dart';

class CartControllingbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
          () => CartController(),
    );
  }
}
