import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/presentation/controllers/cartController.dart';
import 'package:getxdemo/presentation/controllers/productDetailController.dart';
import 'package:getxdemo/presentation/pages/miniCartWidget.dart';
import 'package:getxdemo/utils/constants/Dimens.dart';
import 'package:getxdemo/utils/styles/textStyles.dart';

class ProductDetailScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final productId = args;
    final Productdetailcontroller controller = Get.find();
    final product =
        controller.products.firstWhere((prod) => prod['id'] == productId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "Product Detail",
          style: boldTextStyle(fontSize: Dimens.dp16, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product["image"] ?? ""),
                      fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimens.dp8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.dp8),
                child: Text(
                  product["name"] ?? "",
                  style: regularTextStyle(color: Colors.black, fontSize: Dimens.dp12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: Dimens.dp4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.dp8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product["weight"] ?? "",
                            style: regularTextStyle(color: Colors.grey, fontSize: Dimens.dp10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: Dimens.dp4),
                          Text(
                            "Rs: ${product["price"] ?? ""}",
                            style: regularTextStyle(color: Colors.grey, fontSize: Dimens.dp10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      int quantity = cartController.getQuantity(product["id"]);
                      return quantity > 0
                          ? Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                cartController.removeFromCart(product["id"]);
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text('$quantity'),
                            IconButton(
                              onPressed: () {
                                cartController.addToCart(product["id"]);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      )
                          : ElevatedButton(
                        onPressed: () {
                          cartController.addToCart(product["id"]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        child: Text(
                          "Add to Cart",
                          style: boldTextStyle(color: Colors.black, fontSize: Dimens.dp14),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: Dimens.dp4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.dp8),
                child: Text(
                  product["description"] ?? "",
                  style: regularTextStyle(color: Colors.grey, fontSize: Dimens.dp12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: Dimens.dp16),
              const SizedBox(height: Dimens.dp50),
            ],
          ),
          Obx(() {
            int quantity = cartController.totalItems;
            return quantity > 0
                ? Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MiniCartWidget(
                products: controller.products,
              ),
            )

                : Container();
          }),
        ],
      ),
    );
  }
}
