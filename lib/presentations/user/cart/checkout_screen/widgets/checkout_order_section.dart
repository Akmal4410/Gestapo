import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domain/cart.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_item.dart';

class CheckoutOrderSection extends StatelessWidget {
  const CheckoutOrderSection({
    super.key,
    required this.cartItems,
  });

  final List<Cart> cartItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        const CommonHeading(text: 'Order List'),
        kHeight20,
        ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            final item = cartItems[index];
            return CartItem(
              bgColor: kLightGrey,
              isVisible: false,
              cartItem: Cart(
                productName: item.productName,
                image: item.image,
                size: item.size,
                price: item.price * item.cartCount,
                cartCount: item.cartCount,
              ),
            );
          },
          separatorBuilder: (context, index) => kHeight20,
          itemCount: cartItems.length,
        ),
      ],
    );
  }
}
