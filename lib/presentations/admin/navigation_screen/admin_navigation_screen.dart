import 'package:flutter/material.dart';
import 'package:gestapo/presentations/admin/admin_category_screen/admin_category_screen.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_screen/admin_order_screen.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_products_screen/admin_products_screen.dart';
import 'package:gestapo/presentations/admin/admin_settings_screen/admin_settings_screen.dart';
import 'package:gestapo/resources/resources.dart';

class AdminNavigationScreen extends StatelessWidget {
  AdminNavigationScreen({super.key});

  final List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Orders'),
    BottomNavigationBarItem(
        icon: Icon(Icons.category_outlined), label: 'Catergory'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined), label: 'Products'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined), label: 'Settings'),

    // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users'),
  ];
  final List<Widget> screens = [
    const AdminOrderScreen(),
    const AdminCategoryScreen(),
    const AdminProductsScreen(),
    const AdminSettingsScreen(),

    // Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screens[0],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.kBackgroundColor,
        selectedItemColor: AppColors.kWhite,
        unselectedItemColor: AppColors.kGrey,
        type: BottomNavigationBarType.fixed,
        items: navBarItems,
        currentIndex: 0,
        onTap: (value) {},
      ),
    );
  }
}
