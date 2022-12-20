import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
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
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return AddressCard(screenHeight: screenHeight);
                },
                separatorBuilder: (context, index) => kHeight10,
                itemCount: 3,
              ),
            ),
            CommonButton(
              onPressed: () {},
              buttonText: 'Add new Address',
              bgColor: kWhite,
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
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 27,
            backgroundColor: kWhite,
            child: Icon(
              Icons.location_on_outlined,
              color: kBlack,
            ),
          ),
          title: Text(
            'Home',
            style: TextStyle(fontSize: 17),
          ),
          subtitle: Text('Kinangattil House, 679304'),
          trailing: Radio(
            fillColor: MaterialStateColor.resolveWith(
              (states) => kWhite,
            ),
            value: false,
            groupValue: true,
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
