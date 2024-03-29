import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_list_tile.dart';
import 'package:gestapo/presentations/admin/admin_settings_screen/admin_customer_servide_screen/admin_customer_servide_screen.dart';
import 'package:gestapo/presentations/admin/admin_settings_screen/admin_promo_code_screen/admin_promo_code_screen.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const AdminPromoCodeScreen();
                    },
                  ));
                },
                leading: Icons.percent,
                text: 'Promo code',
              ),
              CustomListTile(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AdminCustomerServiceScreen();
                    },
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
            // ignore: prefer_const_constructors
            Text(
              'Logout',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            kHeight12,
            kDividerGrey,
            kHeight12,
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight12,
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    buttonText: 'Cancel',
                    onPressed: () {},
                    bgColor: AppColors.kGreyDark,
                  ),
                ),
                kWidth12,
                Expanded(
                  child: CommonButton(
                    buttonText: 'Yes, Logout',
                    onPressed: () async {
                      // await GoogleSignIn().disconnect();
                      FirebaseAuth.instance.signOut();
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
    },
  );
}
