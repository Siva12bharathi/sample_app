import 'package:get/get.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var products = <Product>[
    Product(id: 1, name: 'Laptop'),
    Product(id: 2, name: 'Smartphone'),
    Product(id: 3, name: 'Headphones'),
  ].obs;

  void toggleFavorite(int productId) {
    final product = products.firstWhere((p) => p.id == productId);
    product.isFavorite.value = !product.isFavorite.value;
  }
}
