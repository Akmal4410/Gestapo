import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Service'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                return MessageBubble(isMe: index % 2 == 0 ? true : false);
              },
              separatorBuilder: (context, index) => kHeight20,
              itemCount: 5,
            )),
            Row(
              children: [
                const Expanded(
                  child: CustomTextField(
                    hintText: 'Message..',
                    icon: Icons.chat_bubble_outline,
                  ),
                ),
                kWidth10,
                CommonButton(
                  onPressed: () {},
                  buttonText: 'Send',
                  bgColor: kWhite,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.isMe,
  }) : super(key: key);
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          width: 300,
          decoration: BoxDecoration(
            color: isMe ? kWhite : kSpecialGrey,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topLeft: isMe ? Radius.circular(20) : Radius.circular(5),
              topRight: isMe ? Radius.circular(5) : Radius.circular(20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and ever since the 1500s',
                  style: TextStyle(color: isMe ? Colors.black : kWhite),
                ),
              ),
              Text(
                '9:40',
                style: TextStyle(color: isMe ? Colors.black : kWhite),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
