/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class FavoriteScreen extends StatelessWidget {
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Products")),
      body: Obx(() {
        final favorites = productController.products
            .where((p) => p.isFavorite)
            .toList();

        if (favorites.isEmpty) {
          return const Center(child: Text("No favorite products"));
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final product = favorites[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () => productController.toggleFavorite(product),
              ),
            );
          },
        );
      }),
    );
  }
}
*/
