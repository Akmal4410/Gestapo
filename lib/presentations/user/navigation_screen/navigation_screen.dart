import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestapo/application/navigation_screen/navigation_screen_bloc.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/user/cart_screen/cart_screen.dart';
import 'package:gestapo/presentations/user/home/home_screen/home_screen.dart';
import 'package:gestapo/presentations/user/orders_screen/order_screen.dart';
import 'package:gestapo/presentations/user/profile_screen/profile_screen.dart';
import 'package:gestapo/presentations/user/wallet_screen/wallet_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  final List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Orders'),
    BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  final List<Widget> screens = const [
    HomeScreen(),
    CartScreen(),
    OrdersScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationScreenBloc, NavigationScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: screens[state.page],
            ),
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
