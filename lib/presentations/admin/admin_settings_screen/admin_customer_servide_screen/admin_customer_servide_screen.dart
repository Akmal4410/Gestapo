import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/user.dart';
import 'package:gestapo/presentations/user/profile/customer_service_screen/customer_service_screen.dart';

class AdminCustomerServiceScreen extends StatelessWidget {
  const AdminCustomerServiceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Customer Service'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: StreamBuilder(
            stream: UserModel.getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else if (snapshot.hasData) {
                final userslist = snapshot.data!;
                return userslist.isEmpty
                    ? const Center(
                        child: Text('Currently no users'),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final user = userslist[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return CustomerServiceScreen(
                                    docEmail: user.email,
                                  );
                                },
                              ));
                            },
                            leading: CircleAvatar(
                              backgroundColor: kBackgroundColor,
                              radius: 27,
                              backgroundImage: NetworkImage(user.image),
                            ),
                            title: Text("${user.firstName} ${user.lastName}"),
                          );
                        },
                        separatorBuilder: (context, index) => kHeight20,
                        itemCount: userslist.length);
              } else {
                return const Center(
                  child: SpinKitCircle(color: kWhite),
                );
              }
            }),
      ),
    );
  }
}
