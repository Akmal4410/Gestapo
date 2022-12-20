import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestapo/application/navigation_screen/navigation_screen_bloc.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_screen/admin_order_screen.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_products_screen/admin_products_screen.dart';

class AdminNavigationScreen extends StatelessWidget {
  AdminNavigationScreen({super.key});

  final List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Orders'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined), label: 'Products'),
    // BottomNavigationBarItem(icon: Icon(Icons.percent), label: 'Offers'),
    // BottomNavigationBarItem(icon: Icon(Icons.sell_outlined), label: 'Promo'),
    // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users'),
  ];
  final List<Widget> screens = [
    AdminOrderScreen(),
    AdminProductsScreen(),
    // Container(),
    // Container(),
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
            selectedFontSize: 15,
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
