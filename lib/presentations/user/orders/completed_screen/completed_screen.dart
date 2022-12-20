import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/presentations/user/orders/widgets/order_main_card.dart';

class CompletedScreen extends StatelessWidget {
  static const completedScreen = 'CompletedScreen';
  const CompletedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return OrderMainCard(
          isVisible: true,
          deliveryType: 'Completed',
          orderType: 'Leave Review',
          onTap: () {
            leaveReview(context);
          },
        );
      },
      separatorBuilder: (context, index) => kHeight20,
      itemCount: 4,
    );
  }
}

leaveReview(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
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
            CommonHeading(text: 'Leave a Review'),
            kHeight10,
            kDividerGrey,
            kHeight10,
            OrderMainCard(
              deliveryType: '',
              onTap: () {},
              orderType: '',
              isVisible: false,
            ),
            kHeight10,
            kDividerGrey,
            kHeight10,
            CommonHeading(text: 'How is your order'),
            kHeight10,
            Text('Please give your rating & also your review..'),
            kHeight10,
            RatingBar.builder(
              unratedColor: kSpecialGrey,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.white,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            kHeight10,
            CustomTextField(
              hintText: 'Review',
              icon: Icons.reviews,
            ),
            kHeight10,
            kDividerGrey,
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
                    buttonText: 'Submit',
                    onPressed: () {},
                    bgColor: kWhite,
                  ),
                ),
              ],
            ),
            kHeight25,
          ],
        ),
      );
    },
  );
}
