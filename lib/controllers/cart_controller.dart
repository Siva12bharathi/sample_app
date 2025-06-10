import 'package:get/get.dart';

class CartController extends GetxController {
  var items = <int, int>{}.obs; // productId -> quantity

  int get totalItems => items.values.fold(0, (sum, qty) => sum + qty);

  void addItem(int productId) {
    if (items.containsKey(productId)) {
      items[productId] = items[productId]! + 1;
    } else {
      items[productId] = 1;
    }
  }

  void removeItem(int productId) {
    if (items.containsKey(productId)) {
      final currentQty = items[productId]!;
      if (currentQty > 1) {
        items[productId] = currentQty - 1;
      } else {
        items.remove(productId);
      }
    }
  }

  void clearCart() {
    items.clear();
  }
}
