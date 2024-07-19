import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/config/navigation/navigation.dart';
import 'package:getxdemo/config/navigation/routes.dart';
import 'package:getxdemo/config/themes/appTheme.dart';
import 'package:getxdemo/presentation/controllers/cartController.dart';
import 'package:getxdemo/utils/styles/responsive.dart';

void main()async {
  var initialRoute = await Routes.initialRoute;
  Get.put(CartController());
  runApp(Main(initialRoute: initialRoute,));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:initialRoute,
      getPages: Navigation.routes,
      theme: AppThemes.light,
    );
  }
}
