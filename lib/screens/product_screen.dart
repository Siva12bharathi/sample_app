import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../controllers/cart_controller.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productCtrl = Get.find();
  final CartController cartCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      itemCount: productCtrl.products.length,
      itemBuilder: (context, index) {
        final product = productCtrl.products[index];
        final productId = product.id;

        return Card(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Name + Favorite
                Expanded(
                  child: Row(
                    children: [
                      Text(product.name, style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 10),
                      Obx(() => IconButton(
                        icon: Icon(
                          product.isFavorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product.isFavorite.value ? Colors.red : null,
                        ),
                        onPressed: () => productCtrl.toggleFavorite(productId),
                      )),
                    ],
                  ),
                ),

                // Quantity Controls
                Obx(() {
                  final qty = cartCtrl.items[productId] ?? 0;
                  return Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: qty > 0
                            ? () => cartCtrl.removeItem(productId)
                            : null,
                      ),
                      Text('$qty'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => cartCtrl.addItem(productId),
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () => cartCtrl.addItem(productId),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      },
    ));
  }
}
