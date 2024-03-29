import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/domaina/review.dart';
import 'package:gestapo/presentations/user/orders/widgets/order_main_card.dart';

class CompletedScreen extends StatelessWidget {
  static const completedScreen = 'CompletedScreen';
  CompletedScreen({
    Key? key,
  }) : super(key: key);

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Orders.getAllOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          List<Orders> userOrderCompletedList = [];
          final orderList = snapshot.data;
          for (var order in orderList!) {
            if (order.userEmail == userEmail) {
              if (order.isCompleted == true || order.isCancelled == true) {
                userOrderCompletedList.add(order);
              }
            }
          }
          return userOrderCompletedList.isEmpty
              ? const Center(
                  child: Text('There isn\'t any current orders'),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final order = userOrderCompletedList[index];
                    return OrderMainCard(
                      order: order,
                      isVisible: order.isCancelled == true ? false : true,
                      deliveryType:
                          order.isCancelled ? 'Cancelled' : 'Completed',
                      orderType: 'Review',
                      onTap: () {
                        leaveReview(context, order);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => kHeight20,
                  itemCount: userOrderCompletedList.length,
                );
        } else {
          return const Center(
            child: SpinKitCircle(color: AppColors.kWhite),
          );
        }
      },
    );
  }
}

leaveReview(BuildContext context, Orders order) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return ReviewBottomSheetCard(order: order);
    },
  );
}

class ReviewBottomSheetCard extends StatefulWidget {
  const ReviewBottomSheetCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Orders order;

  @override
  State<ReviewBottomSheetCard> createState() => _ReviewBottomSheetCardState();
}

class _ReviewBottomSheetCardState extends State<ReviewBottomSheetCard> {
  final formKey = GlobalKey<FormState>();
  final reviewController = TextEditingController();
  double rating = 2.5;
  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.kBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kHeight12,
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.kGreyDark,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          kHeight12,
          const CommonHeading(text: 'Leave a Review'),
          kHeight12,
          kDividerGrey,
          kHeight12,
          OrderMainCard(
            order: widget.order,
            deliveryType: 'Completed',
            onTap: () {},
            orderType: '',
            isVisible: false,
          ),
          kHeight12,
          kDividerGrey,
          kHeight12,
          const CommonHeading(text: 'How is your order'),
          kHeight12,
          const Text('Please give your rating & also your review..'),
          kHeight12,
          RatingBar.builder(
            unratedColor: AppColors.kGreyDark,
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.white,
            ),
            onRatingUpdate: (newRating) {
              setState(() {
                rating = newRating;
              });
            },
          ),
          kHeight12,
          Form(
            key: formKey,
            child: CustomTextField(
              controller: reviewController,
              hintText: 'Review',
              icon: Icons.reviews,
              validator: (review) {
                if (review != null && review.isEmpty) {
                  return 'Enter something';
                } else {
                  return null;
                }
              },
            ),
          ),
          kHeight12,
          kDividerGrey,
          kHeight12,
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  buttonText: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  bgColor: AppColors.kGreyDark,
                ),
              ),
              kWidth12,
              Expanded(
                child: CommonButton(
                  buttonText: 'Submit',
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    await Review.addReview(
                      email: userEmail!,
                      productName: widget.order.productName,
                      review: reviewController.text.trim(),
                      rating: rating,
                    );
                    log('Review added');
                    Navigator.pop(context);
                  },
                  bgColor: AppColors.kWhite,
                ),
              ),
            ],
          ),
          kHeight24,
        ],
      ),
    );
  }
}
