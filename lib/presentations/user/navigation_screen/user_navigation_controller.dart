import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNavigationController extends GetxController {
  Rx<int> currentPage = Rx(0);

  final List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Orders',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  void onInit() {
    currentPage(0);
    super.onInit();
  }

  void onPageChanged(int newPage) => currentPage(newPage);
}
