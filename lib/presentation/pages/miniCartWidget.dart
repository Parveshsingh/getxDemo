import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/utils/constants/Dimens.dart';
import '../controllers/cartController.dart';

class MiniCartWidget extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final List<Map<String, dynamic>> products;

  MiniCartWidget({required this.products});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 10,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: Dimens.dp8),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Items in Cart: ${cartController.totalItems}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'Total Rs: ${cartController.getTotalPrice(products).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
