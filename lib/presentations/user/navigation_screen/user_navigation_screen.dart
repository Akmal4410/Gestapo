import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/presentations/user/cart/cart_screen/cart_screen.dart';
import 'package:gestapo/presentations/user/home/home_screen/home_screen.dart';
import 'package:gestapo/presentations/user/navigation_screen/user_navigation_controller.dart';
import 'package:gestapo/presentations/user/orders/orders_screen/order_screen.dart';
import 'package:gestapo/presentations/user/profile/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

class UserNavigationScreen extends GetView<UserNavigationController> {
  const UserNavigationScreen({super.key});

  static final List<Widget> _screens = [
    const HomeScreen(),
    CartScreen(),
    const OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SafeArea(child: _screens[controller.currentPage.value])),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.kBackgroundColor,
        selectedItemColor: AppColors.kWhite,
        unselectedItemColor: AppColors.kGreyLight,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        items: controller.navBarItems,
        currentIndex: controller.currentPage.value,
        onTap: controller.onPageChanged,
      ),
    );
  }
}
