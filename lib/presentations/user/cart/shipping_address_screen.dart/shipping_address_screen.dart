import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/domaina/address.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_common_card.dart';
import 'package:gestapo/presentations/user/profile/address_screen/address_screen.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final user = FirebaseAuth.instance.currentUser!.email;
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, selectedValue);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Shipping Address'),
        centerTitle: false,
      ),
      body: StreamBuilder(
          stream: Address.getAddressStream(user!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              final addressList = snapshot.data;
              return Column(
                children: [
                  Expanded(
                    child: addressList!.isEmpty
                        ? const Center(
                            child: Text('No Address'),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20.0),
                            child: Column(
                              children: [
                                ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CartCommonCard(
                                      leadingIcon: Icons.location_on,
                                      title: addressList[index].addressName,
                                      subTitle:
                                          addressList[index].addressDetails,
                                      trailing: Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                          (states) => AppColors.kWhite,
                                        ),
                                        value: addressList[index].addressName,
                                        groupValue: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value!;
                                          });
                                        },
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      kHeight20,
                                  itemCount: addressList.length,
                                ),
                                kHeight20,
                                SizedBox(
                                  width: double.infinity,
                                  child: CommonButton(
                                    onPressed: () {},
                                    buttonText: 'Apply',
                                    bgColor: AppColors.kSpecialGrey,
                                  ),
                                )
                              ],
                            ),
                          ),
                  ),
                  CustomBottomButton(
                    buttonText: 'Add new Address',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddressScreen();
                          },
                        ),
                      );
                    },
                  )
                ],
              );
            } else {
              return const Center(
                child: SpinKitCircle(color: AppColors.kWhite),
              );
            }
          }),
    );
  }
}
