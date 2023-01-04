import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/domain/promocode.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_common_card.dart';

class AddPromoScreen extends StatefulWidget {
  const AddPromoScreen({
    super.key,
    required this.promoCodeList,
  });
  final List<PromoCode> promoCodeList;

  @override
  State<AddPromoScreen> createState() => _AddPromoScreenState();
}

class _AddPromoScreenState extends State<AddPromoScreen> {
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.pop(context, selectedValue);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Add Promo'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CartCommonCard(
                    leadingIcon: Icons.percent,
                    title: 'Special ${widget.promoCodeList[index].promo}% off',
                    subTitle: widget.promoCodeList[index].details,
                    trailing: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => kWhite,
                      ),
                      value: widget.promoCodeList[index].promo,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => kHeight20,
                itemCount: widget.promoCodeList.length,
              ),
            ),
          ),
          CustomBottomButton(
            buttonText: 'Apply',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
