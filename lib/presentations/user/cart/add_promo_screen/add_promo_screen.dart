import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/domaina/promocode.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_common_card.dart';

class AddPromoScreen extends StatefulWidget {
  const AddPromoScreen({
    super.key,
  });

  @override
  State<AddPromoScreen> createState() => _AddPromoScreenState();
}

class _AddPromoScreenState extends State<AddPromoScreen> {
  int selectedValue = 0;

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
              child: StreamBuilder(
                stream: PromoCode.getStreamPromoCode(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  } else if (snapshot.hasData) {
                    final promoCodeList = snapshot.data;
                    return promoCodeList!.isEmpty
                        ? const Center(
                            child: Text('There is currently no promo code'),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return CartCommonCard(
                                leadingIcon: Icons.percent,
                                title:
                                    'Special ${promoCodeList[index].promo}% off',
                                subTitle: promoCodeList[index].details,
                                trailing: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => kWhite,
                                  ),
                                  value: promoCodeList[index].promo,
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
                            itemCount: promoCodeList.length,
                          );
                  } else {
                    return const Center(
                      child: SpinKitCircle(
                        color: kWhite,
                      ),
                    );
                  }
                },
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
