import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domaina/address.dart';
import 'package:gestapo/presentations/user/cart/shipping_address_screen.dart/shipping_address_screen.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_common_card.dart';

class CheckoutAddressSection extends StatelessWidget {
  CheckoutAddressSection({
    super.key,
    required this.callBackAddress,
  });
  final user = FirebaseAuth.instance.currentUser!.email;
  final void Function(Address) callBackAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonHeading(text: 'Shipping Address'),
        kHeight24,
        FutureBuilder<List<Address>>(
          future: Address.getAddressStream(user!).first,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              final addressList = snapshot.data;
              if (addressList!.isEmpty) {
                return Center(
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Address is not given, you cannot proceed without an address',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ShippingAddressScreen();
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.kWhite,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                Address address = Address(
                  addressName: addressList[0].addressName,
                  addressDetails: addressList[0].addressDetails,
                );
                callBackAddress(address);
                return StatefulBuilder(
                  builder: (context, setState) {
                    return CartCommonCard(
                      leadingIcon: Icons.location_on,
                      title: address.addressName,
                      subTitle: address.addressDetails,
                      trailing: GestureDetector(
                        onTap: () async {
                          final addressName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ShippingAddressScreen();
                              },
                            ),
                          );
                          for (var item in addressList) {
                            if (item.addressName == addressName) {
                              setState(() {
                                address = Address(
                                  addressName: item.addressName,
                                  addressDetails: item.addressDetails,
                                );
                              });
                            }
                          }
                          callBackAddress(address);
                        },
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.kWhite,
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return const Center(
                child: SpinKitCircle(color: AppColors.kWhite),
              );
            }
          },
        ),
        kHeight20,
      ],
    );
  }
}
