import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/widget/text_row.dart';

class AdminOrdeDetailsSection extends StatelessWidget {
  const AdminOrdeDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextRow(
                text1: 'Order No. : 001',
                text2: 'User ID : 002',
              ),
              kHeight10,
              Text(
                'Date : 16/03/222',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
              TextRow(text1: 'Air Jordan 3 Retro', text2: '1500rs'),
              kHeight10,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, es,',
                style: TextStyle(
                  color: kGrey,
                ),
              ),
              kHeight10,
              Text(
                'Size : 41',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
              Text(
                'Qty : 1',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
              CommonHeading(text: 'User Details'),
              kHeight10,
              Text('Mohammed Akmal'),
              Text('akmalmahmoodkinan@gmail.com'),
              kHeight20,
              CommonHeading(text: 'Shipping Address'),
              kHeight10,
              Text('Home'),
              Text('Kinangattil(H), Thiruvegappura'),
            ],
          ),
        ),
      ),
    );
  }
}
