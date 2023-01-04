import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_list_tile.dart';
import 'package:gestapo/presentations/user/profile/address_screen/address_screen.dart';
import 'package:gestapo/presentations/user/profile/customer_service_screen/customer_service_screen.dart';
import 'package:gestapo/presentations/user/profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:gestapo/presentations/user/profile/help_center_screen/help_center_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            const ProfileAvatarCard(),
            kHeight10,
            kDivider,
            CustomListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ));
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
                      builder: (context) => const CustomerServiceScreen(),
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
  const ProfileAvatarCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          kHeight25,
          Stack(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: kWhite,
                backgroundImage: AssetImage('assets/images/akmal.jpg'),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Icon(Icons.edit),
                ),
              )
            ],
          ),
          kHeight10,
          const Text(
            'Mohammed Akmal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
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
                    bgColor: kSpecialGrey,
                  ),
                ),
                kWidth10,
                Expanded(
                  child: CommonButton(
                    buttonText: 'Yes, Logout',
                    onPressed: () async {
                      // await GoogleSignIn().disconnect();
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
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
