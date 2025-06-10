import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../controllers/product_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartCtrl = Get.find();
  final ProductController productCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartCtrl.items.isEmpty) {
        return Center(child: Text('Your cart is empty'));
      }
      return Column(
        children: [
          Expanded(
            child: ListView(
              children: cartCtrl.items.entries.map((entry) {
                final productId = entry.key;
                final qty = entry.value;
                final product = productCtrl.products
                    .firstWhere((p) => p.id == productId);
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Quantity: $qty'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () => cartCtrl.removeItem(productId),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => cartCtrl.clearCart(),
              child: Text('Clear Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 40),
              ),
            ),
          ),
        ],
      );
    });
  }
}
