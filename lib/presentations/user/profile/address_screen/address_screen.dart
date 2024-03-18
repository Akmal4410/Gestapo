import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/domaina/address.dart';
import 'package:gestapo/presentations/user/profile/add_current_address_screen/add_current_address_screen.dart';
import 'package:gestapo/presentations/user/profile/add_new_address_screen/add_new_address_screen.dart';
import 'package:gestapo/utils/utils.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: StreamBuilder<List<Address>>(
                stream: Address.getAddressStream(user!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  } else if (snapshot.hasData) {
                    final addressList = snapshot.data;
                    if (addressList!.isEmpty) {
                      return const Center(
                        child: Text('No Address'),
                      );
                    } else {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          log(addressList[index].addressDetails.toString());
                          return AddressCard(
                            addressName: addressList[index].addressName,
                            addressDetails: addressList[index].addressDetails,
                          );
                        },
                        separatorBuilder: (context, index) => kHeight10,
                        itemCount: addressList.length,
                      );
                    }
                  } else {
                    return const Center(
                      child: SpinKitCircle(
                        color: AppColors.kWhite,
                      ),
                    );
                  }
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddNewAddressScreen();
                        },
                      ),
                    );
                  },
                  buttonText: 'Add new Address',
                  bgColor: AppColors.kWhite,
                ),
                kHeight20,
                CommonButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AddCurrentAddressScreen();
                        },
                      ),
                    );
                  },
                  buttonText: 'Add current Address',
                  bgColor: AppColors.kWhite,
                ),
              ],
            ),
            kHeight25,
          ],
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.addressName,
    required this.addressDetails,
  }) : super(key: key);
  final String addressName;
  final String addressDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: ListTile(
            leading: const CircleAvatar(
              radius: 27,
              backgroundColor: AppColors.kWhite,
              child: Icon(
                Icons.location_on_outlined,
                color: AppColors.kBlack,
              ),
            ),
            title: Text(
              addressName,
              style: const TextStyle(fontSize: 17),
            ),
            subtitle: Text(addressDetails),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: AppColors.kWhite,
              ),
            )),
      ),
    );
  }
}
