import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/quantity_add_widget.dart';
import 'package:gestapo/core/widgets/quantity_widget.dart';
import 'package:gestapo/domain/cart.dart';
import 'package:gestapo/domain/utils.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    required this.bgColor,
    this.isVisible = true,
    required this.cartItem,
  }) : super(key: key);
  final Color bgColor;
  final bool isVisible;
  final Cart cartItem;
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.12,
            width: screenHeight * 0.12,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  cartItem.image,
                ),
              ),
              color: kSpecialGrey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          kWidth10,
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartItem.productName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: GestureDetector(
                          onTap: () {
                            removeFromCart(
                              cartItem: cartItem,
                              context: context,
                            );
                          },
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            color: kWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Size = ${cartItem.size}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "??? ${cartItem.price.toString()}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      isVisible == true
                          ? QuantityAddWidget(
                              getQuantity: (newQty) async {
                                await Cart.updateCart(
                                  cartItem: cartItem,
                                  quantity: newQty,
                                  user: user!,
                                );
                              },
                              currentQuantity: cartItem.cartCount,
                            )
                          : QuantityWidget(quantity: cartItem.cartCount),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

removeFromCart({
  required BuildContext context,
  required Cart cartItem,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      final user = FirebaseAuth.instance.currentUser!.email;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            kHeight10,
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: kSpecialGrey,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            kHeight10,
            const Text(
              'Remove From Cart ?',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight10,
            const Divider(
              color: kLightGrey,
              thickness: 2,
            ),
            kHeight10,
            CartItem(
              bgColor: kLightGrey,
              cartItem: cartItem,
              isVisible: false,
            ),
            kHeight10,
            const Divider(
              color: kLightGrey,
              thickness: 2,
            ),
            kHeight10,
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    buttonText: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    bgColor: kSpecialGrey,
                  ),
                ),
                kWidth10,
                Expanded(
                  child: CommonButton(
                    buttonText: 'Yes, Remove',
                    onPressed: () async {
                      Navigator.pop(context);
                      Utils.customSnackbar(
                        context: context,
                        text: "Item removed from the cart successfully",
                        type: AnimatedSnackBarType.error,
                      );

                      await Cart.deleteCartItem(
                        user: user!,
                        cartItem: cartItem,
                      );
                    },
                    bgColor: kWhite,
                  ),
                ),
              ],
            ),
            kHeight25,
            kHeight25,
          ],
        ),
      );
    },
  );
}
