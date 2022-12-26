import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestapo/application/navigation_screen/navigation_screen_bloc.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/admin/admin_category_screen/admin_category_screen.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_screen/admin_order_screen.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_products_screen/admin_products_screen.dart';
import 'package:gestapo/presentations/admin/admin_settings_screen/admin_settings_screen.dart';

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
    AdminOrderScreen(),
    AdminCategoryScreen(),
    AdminProductsScreen(),
    AdminSettingsScreen(),

    // Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationScreenBloc, NavigationScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: screens[state.page],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kBackgroundColor,
            selectedItemColor: kWhite,
            unselectedItemColor: kGrey,
            type: BottomNavigationBarType.fixed,
            items: navBarItems,
            currentIndex: state.page,
            onTap: (value) {
              BlocProvider.of<NavigationScreenBloc>(context).add(
                OnPageChanged(newPage: value),
              );
            },
          ),
        );
      },
    );
  }
}
