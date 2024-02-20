import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/user/profile/help_center_screen/widgets/contact_us_tile.dart';
import 'package:gestapo/presentations/user/profile/help_center_screen/widgets/help_faq_tile.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Help Center'),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: kWhite,
            tabs: [
              Tab(
                text: 'FAQ',
              ),
              Tab(
                text: 'Contact us',
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TabBarView(
            children: [
              const FAQ(),
              ContactUs(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  ContactUs({
    Key? key,
  }) : super(key: key);

  List<String> titles = [
    'Whats App',
    'FaceBook',
    'Website',
  ];

  List<IconData> icons = [
    Icons.wechat,
    Icons.facebook_outlined,
    Icons.language_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ContactUsTile(
          icon: icons[index],
          title: titles[index],
        );
      },
      separatorBuilder: (context, index) => kHeight20,
      itemCount: icons.length,
    );
  }
}

class FAQ extends StatelessWidget {
  const FAQ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const HelpFAQTile();
      },
      separatorBuilder: (context, index) => kHeight10,
      itemCount: 4,
    );
  }
}
