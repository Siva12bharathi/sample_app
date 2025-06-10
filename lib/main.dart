import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart_getx/screens/main_screen.dart';
import 'controllers/product_controller.dart';
import 'controllers/cart_controller.dart';
import 'screens/product_screen.dart';

void main() {
  Get.put(ProductController());
  Get.put(CartController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping Cart with GetX',
      home: MainScreen(),
    );
  }
}
