import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxdemo/config/navigation/routes.dart';
import 'package:getxdemo/presentation/controllers/cartController.dart';
import 'package:getxdemo/presentation/controllers/homeController.dart';
import 'package:getxdemo/presentation/pages/miniCartWidget.dart';
import 'package:getxdemo/presentation/widgets/shimmerWidget.dart';
import 'package:getxdemo/utils/constants/Dimens.dart';
import 'package:getxdemo/utils/styles/responsive.dart';
import 'package:getxdemo/utils/styles/textStyles.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.only(left: Dimens.dp16),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: Dimens.dp16),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
          title: Text(
            "Home",
            style: boldTextStyle(fontSize: Dimens.dp16, color: Colors.white),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return ShimmerLoader();
          } else {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*Search InputText Field*/
                      Padding(
                        padding: const EdgeInsets.only(top: Dimens.dp16),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimens.dp16),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(Dimens.dp14),
                              hintText: 'Search Here',
                              hintStyle: const TextStyle(
                                fontSize: Dimens.dp14,
                                color: Colors.grey,
                              ),
                              suffixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(Dimens.dp8),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(Dimens.dp8),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(Dimens.dp8),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      /*Image Banners*/
                      Padding(
                        padding: const EdgeInsets.only(top: Dimens.dp16),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimens.dp16),
                          child: CarouselSlider(
                            items: controller.bannerImageList
                                .map((item) => Image.asset(item))
                                .toList(),
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 2 / 3,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  controller.currentIndex = index;
                                });
                              },
                            ),
                            carouselController: controller.carouselController,
                          ),
                        ),
                      ),
                      /*Category List*/
                      Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.dp16,
                            left: Dimens.dp16,
                            right: Dimens.dp16),
                        child: Text(
                          "Categories",
                          style: boldTextStyle(
                              color: Colors.black, fontSize: Dimens.dp14),
                        ),
                      ),
                      const SizedBox(height: Dimens.dp8),
                      Container(
                        height: 90,
                        margin:
                            const EdgeInsets.symmetric(horizontal: Dimens.dp16),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categoriesList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(Dimens.dp8),
                                  child: CircleAvatar(
                                    radius: Dimens.dp24,
                                    backgroundImage: NetworkImage(controller
                                        .categoriesList[index]["image"]!),
                                  ),
                                ),
                                Text(
                                  controller.categoriesList[index]["name"]!,
                                  textAlign: TextAlign.center,
                                  style: boldTextStyle(
                                      color: Colors.black,
                                      fontSize: Dimens.dp12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      /*Recently Ordered List*/
                      Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.dp16,
                            left: Dimens.dp16,
                            right: Dimens.dp16),
                        child: Text(
                          "Recently Ordered",
                          style: boldTextStyle(
                              color: Colors.black, fontSize: Dimens.dp14),
                        ),
                      ),
                      const SizedBox(height: Dimens.dp8),
                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == Dimens.dp0
                                      ? Dimens.dp16
                                      : Dimens.dp8,
                                  right: index == controller.products.length - 1
                                      ? Dimens.dp16
                                      : Dimens.dp0),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.products,
                                      arguments: controller.products[index]
                                          ["id"]);
                                },
                                child: Card(
                                  elevation: 3,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: 160.0, // Adjust width as needed
                                    padding: const EdgeInsets.all(Dimens.dp8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 96.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimens.dp8),
                                            image: DecorationImage(
                                              image: NetworkImage(controller
                                                  .products[index]["image"]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: Dimens.dp4),
                                        Text(
                                          controller.products[index]["name"],
                                          style: regularTextStyle(
                                              fontSize: Dimens.dp12,
                                              color: Colors.black),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: Dimens.dp4),
                                        Text(
                                          controller.products[index]["weight"],
                                          style: regularTextStyle(
                                              fontSize: Dimens.dp10,
                                              color: Colors.grey),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: Dimens.dp4),
                                        Text(
                                          "Rs: ${controller.products[index]["price"]}",
                                          style: regularTextStyle(
                                              fontSize: Dimens.dp10,
                                              color: Colors.grey),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Spacer(),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Obx(() {
                                            int quantity =
                                                cartController.getQuantity(
                                                    controller.products[index]
                                                        ["id"]);
                                            return quantity > 0
                                                ? Container(
                                                    height: 40,
                                                    width: 130,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            cartController
                                                                .removeFromCart(
                                                                    controller
                                                                            .products[index]
                                                                        ["id"]);
                                                          },
                                                          icon: const Icon(
                                                              Icons.remove),
                                                        ),
                                                        Text('$quantity'),
                                                        IconButton(
                                                          onPressed: () {
                                                            cartController.addToCart(
                                                                controller.products[
                                                                        index]
                                                                    ["id"]);
                                                          },
                                                          icon: const Icon(
                                                              Icons.add),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : ElevatedButton(
                                                    onPressed: () {
                                                      cartController.addToCart(
                                                          controller.products[
                                                              index]["id"]);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        side: const BorderSide(
                                                            color: Colors.grey,
                                                            width: 1.0),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Add to Cart",
                                                      style: boldTextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              Dimens.dp14),
                                                    ),
                                                  );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      /*Seasonal Products*/
                      Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.dp16,
                            left: Dimens.dp16,
                            right: Dimens.dp16),
                        child: Text(
                          "Seasonal Products",
                          style: boldTextStyle(
                              fontSize: Dimens.dp14, color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: Dimens.dp8),
                      ListView.builder(
                        itemCount: controller.products.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.products,
                                    arguments: controller.products[index]
                                        ["id"]);
                              },
                              child: Card(
                                elevation: 3,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.dp8),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 96.0,
                                          height: 96.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            image: DecorationImage(
                                              image: NetworkImage(controller
                                                  .products[index]["image"]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: Dimens.dp8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.products[index]
                                                    ["name"],
                                                style: boldTextStyle(
                                                  fontSize: Dimens.dp12,
                                                  color: Colors.black,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                  height: Dimens.dp4),
                                              Text(
                                                controller.products[index]
                                                    ["weight"],
                                                style: regularTextStyle(
                                                  fontSize: Dimens.dp10,
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                  height: Dimens.dp4),
                                              Text(
                                                "Rs: ${controller.products[index]["price"]}",
                                                style: regularTextStyle(
                                                  fontSize: Dimens.dp10,
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                  height: Dimens.dp8),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Obx(() {
                                                  int quantity = cartController
                                                      .getQuantity(controller
                                                              .products[index]
                                                          ["id"]);
                                                  return quantity > 0
                                                      ? Container(
                                                          height: 40,
                                                          width: 130,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              IconButton(
                                                                onPressed: () {
                                                                  cartController.removeFromCart(
                                                                      controller
                                                                              .products[index]
                                                                          [
                                                                          "id"]);
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .remove),
                                                              ),
                                                              Text('$quantity'),
                                                              IconButton(
                                                                onPressed: () {
                                                                  cartController.addToCart(
                                                                      controller
                                                                              .products[index]
                                                                          [
                                                                          "id"]);
                                                                },
                                                                icon: const Icon(
                                                                    Icons.add),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : ElevatedButton(
                                                          onPressed: () {
                                                            cartController.addToCart(
                                                                controller.products[
                                                                        index]
                                                                    ["id"]);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1.0),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Add to Cart",
                                                            style: boldTextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: Dimens
                                                                    .dp14),
                                                          ),
                                                        );
                                                }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: Dimens.dp50),
                    ],
                  ),
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
            );
          }
        }));
  }
}
