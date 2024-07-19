import 'package:get/get.dart';
import 'package:getxdemo/config/navigation/binding/cartControllingBinding.dart';
import 'package:getxdemo/config/navigation/binding/homeControllingBinding.dart';
import 'package:getxdemo/config/navigation/binding/productDetailControllingBinding.dart';
import 'package:getxdemo/config/navigation/routes.dart';
import 'package:getxdemo/presentation/pages/home.dart';
import 'package:getxdemo/presentation/pages/miniCartWidget.dart';
import 'package:getxdemo/presentation/pages/productDetailPage.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeControllerBinding()),
    GetPage(
        name: Routes.products,
        page: () =>  ProductDetailScreen(),
        binding: ProductControllBinding()),
    GetPage(
        name: Routes.cart,
        page: () =>  MiniCartWidget(products: const [{}],),
        binding: CartControllingbinding())
  ];
}
