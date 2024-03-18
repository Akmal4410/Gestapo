import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_list_tile.dart';
import 'package:gestapo/domaina/user.dart';
import 'package:gestapo/presentations/user/profile/address_screen/address_screen.dart';
import 'package:gestapo/presentations/user/profile/customer_service_screen/customer_service_screen.dart';
import 'package:gestapo/presentations/user/profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:gestapo/presentations/user/profile/help_center_screen/help_center_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight20,
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ProfileAvatarCard(),
            kHeight10,
            kDivider,
            CustomListTile(
              onTap: () async {
                final user =
                    await UserModel.getCurrentUserData(email: userEmail!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(user: user),
                  ),
                );
              },
              leading: Icons.person_outline_rounded,
              text: 'Edit Profile',
            ),
            CustomListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressScreen(),
                    ));
              },
              leading: Icons.location_on_outlined,
              text: 'Address',
            ),
            CustomListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpCenterScreen(),
                    ));
              },
              leading: Icons.help_center_outlined,
              text: 'Help Center',
            ),
            CustomListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerServiceScreen(
                        docEmail: userEmail!,
                      ),
                    ));
              },
              leading: Icons.support_agent_outlined,
              text: 'Customer Service',
            ),
            CustomListTile(
              color: Colors.red,
              onTap: () {
                signOut(context);
              },
              leading: Icons.logout_outlined,
              text: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileAvatarCard extends StatelessWidget {
  ProfileAvatarCard({
    Key? key,
  }) : super(key: key);
  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<UserModel>(
          future: UserModel.getCurrentUserData(email: userEmail!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Somthing went wrong'));
            } else if (snapshot.hasData) {
              log('user has data');
              final user = snapshot.data!;
              return Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.kBackgroundColor,
                        backgroundImage: NetworkImage(user.image),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return EditProfileScreen(user: user);
                              },
                            ));
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColors.kWhite,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      )
                    ],
                  ),
                  kHeight10,
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            } else {
              log('user has no data');
              return const Center(
                child: SpinKitCircle(
                  color: AppColors.kWhite,
                ),
              );
            }
          }),
    );
  }
}

void signOut(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.kBackgroundColor,
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
                color: AppColors.kGreyDark,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            kHeight10,
            // ignore: prefer_const_constructors
            Text(
              'Logout',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            kHeight10,
            kDividerGrey,
            kHeight10,
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight10,
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    buttonText: 'Cancel',
                    onPressed: () {},
                    bgColor: AppColors.kGreyDark,
                  ),
                ),
                kWidth10,
                Expanded(
                  child: CommonButton(
                    buttonText: 'Yes, Logout',
                    onPressed: () async {
                      // await GoogleSignIn().disconnect();
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                    bgColor: AppColors.kWhite,
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
