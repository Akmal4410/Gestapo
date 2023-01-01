import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/quantity_add_widget.dart';
import 'package:gestapo/core/widgets/quantity_widget.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    required this.bgColor,
    this.isVisible = true,
  }) : super(key: key);
  final Color bgColor;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: kSpecialGrey,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset('assets/images/shoes.png'),
          ),
          kWidth10,
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Air Jordan 3 Retro',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: GestureDetector(
                          onTap: () {
                            removeFromCart(context);
                          },
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: kWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Size = 42',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1500.00',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      isVisible == true
                          ? QuantityAddWidget(
                              getQuantity: (int) {},
                            )
                          : QuantityWidget(),
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

removeFromCart(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
            Text(
              'Remove From Cart ?',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight10,
            Divider(
              color: kLightGrey,
              thickness: 2,
            ),
            kHeight10,
            CartItem(
              bgColor: kLightGrey,
            ),
            kHeight10,
            Divider(
              color: kLightGrey,
              thickness: 2,
            ),
            kHeight10,
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    buttonText: 'Cancel',
                    onPressed: () {},
                    bgColor: kSpecialGrey,
                  ),
                ),
                kWidth10,
                Expanded(
                  child: CommonButton(
                    buttonText: 'Yes, Remove',
                    onPressed: () {},
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
