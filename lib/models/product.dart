import 'package:get/get.dart';

class Product {
  final int id;
  final String name;
  var isFavorite = false.obs;

  Product({required this.id, required this.name});
}
