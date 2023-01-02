import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domain/cart.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_checkout_card.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Cart>>(
        stream: Cart.getCartItems(userEmail!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            final cartItems = snapshot.data;
            if (cartItems!.isEmpty) {
              return const Center(
                child: Text('The cart is empty'),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Cart',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          kHeight25,
                          Expanded(
                            child: ListView.separated(
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CartItem(
                                  bgColor: kLightGrey,
                                  cartItem: cartItems[index],
                                );
                              },
                              separatorBuilder: (context, index) => kHeight20,
                              itemCount: cartItems.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CartCheckoutCard()
                ],
              );
            }
          } else {
            return const Center(
              child: SpinKitCircle(color: kWhite),
            );
          }
        });
  }
}
