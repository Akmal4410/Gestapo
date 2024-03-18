import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/quantity_add_widget.dart';
import 'package:gestapo/core/widgets/quantity_widget.dart';
import 'package:gestapo/domaina/cart.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/utils/utils.dart';

class CartItem extends StatelessWidget {
  CartItem({
    super.key,
    required this.bgColor,
    this.isVisible = true,
    required this.cartItem,
  });
  final Color bgColor;
  final bool isVisible;
  final Cart cartItem;
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
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
            height: context.height * 0.12,
            width: context.height * 0.12,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  cartItem.image,
                ),
              ),
              color: AppColors.kSpecialGrey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          kWidth10,
          Expanded(
            child: SizedBox(
              height: context.height * 0.12,
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
                            color: AppColors.kWhite,
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
                        "₹ ${cartItem.price.toString()}",
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
          color: AppColors.kBackgroundColor,
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
                color: AppColors.kSpecialGrey,
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
              color: AppColors.kLightGrey,
              thickness: 2,
            ),
            kHeight10,
            CartItem(
              bgColor: AppColors.kLightGrey,
              cartItem: cartItem,
              isVisible: false,
            ),
            kHeight10,
            const Divider(
              color: AppColors.kLightGrey,
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
                    bgColor: AppColors.kSpecialGrey,
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
                    bgColor: AppColors.kWhite,
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
