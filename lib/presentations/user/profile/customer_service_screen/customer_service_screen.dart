import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/message.dart';
import 'package:intl/intl.dart';

class CustomerServiceScreen extends StatelessWidget {
  CustomerServiceScreen({super.key, required this.docEmail});
  final formKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  final userEmail = FirebaseAuth.instance.currentUser!.email;
  final String docEmail;

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
              child: StreamBuilder<List<Message>>(
                stream: Message.getAllmessagess(email: docEmail),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  } else if (snapshot.hasData) {
                    //  List<MessageBubble> messageBubbleList = [];
                    final messagesList = snapshot.data!.reversed;

                    return ListView.separated(
                      reverse: true,
                      separatorBuilder: (context, index) => kHeight10,
                      itemBuilder: (context, index) {
                        final message = messagesList.toList()[index];
                        return MessageBubble(
                          isMe: message.email == userEmail ? true : false,
                          message: message,
                        );
                      },
                      itemCount: messagesList.length,
                    );
                  } else {
                    return const Center(
                      child: SpinKitCircle(color: kWhite),
                    );
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: CustomTextField(
                      controller: messageController,
                      hintText: 'Message..',
                      icon: Icons.chat_bubble_outline,
                      validator: (message) {
                        if (message != null && message.isEmpty) {
                          return 'Enter message';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                kWidth10,
                CommonButton(
                  onPressed: () {
                    DateTime now = DateTime.now();

                    if (!formKey.currentState!.validate()) return;
                    Message.sendMessage(
                      originalTime: "${now.hour}:${now.minute}:${now.second}",
                      senderemail: userEmail!,
                      docEmail: docEmail,
                      text: messageController.text.trim(),
                      time: DateFormat.jm().format(DateTime.now()),
                    );
                    messageController.clear();
                    log('message message sended');
                  },
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
    required this.message,
  }) : super(key: key);
  final bool isMe;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          width: 300,
          decoration: BoxDecoration(
            color: isMe ? kWhite : kSpecialGrey,
            borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(20),
              bottomLeft: const Radius.circular(20),
              topLeft:
                  isMe ? const Radius.circular(20) : const Radius.circular(5),
              topRight:
                  isMe ? const Radius.circular(5) : const Radius.circular(20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  message.message,
                  style: TextStyle(color: isMe ? Colors.black : kWhite),
                ),
              ),
              Text(
                message.time,
                style: TextStyle(color: isMe ? Colors.black : kWhite),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
