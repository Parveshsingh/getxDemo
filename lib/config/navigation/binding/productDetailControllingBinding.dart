import 'package:get/get.dart';
import 'package:getxdemo/presentation/controllers/productDetailController.dart';

class ProductControllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Productdetailcontroller>(
          () => Productdetailcontroller(),
    );
  }
}
