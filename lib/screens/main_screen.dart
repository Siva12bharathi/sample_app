import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'cart_screen.dart';
import 'product_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CartController cartCtrl = Get.put(CartController());
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ProductScreen(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Shopping Cart'),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'Cart: ${cartCtrl.totalItems}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}
