import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/promocode.dart';

class AdminPromoCodeScreen extends StatelessWidget {
  const AdminPromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Promo Code'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: PromoCode.getStreampromoCode(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              final promoList = snapshot.data;
              if (promoList!.isEmpty) {
                return const Center(
                  child: Text('Promo Code List is empty'),
                );
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => kHeight10,
                  itemCount: promoList.length,
                  itemBuilder: (context, index) {
                    return AdminPromoCardWidget(
                      promoList: promoList,
                      index: index,
                    );
                  },
                );
              }
            } else {
              return const Center(
                child: SpinKitCircle(color: kWhite),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSpecialGrey,
        onPressed: () {
          showAddPromoCodeDialoge(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AdminPromoCardWidget extends StatelessWidget {
  const AdminPromoCardWidget({
    Key? key,
    required this.index,
    required this.promoList,
  }) : super(key: key);

  final int index;
  final List<PromoCode> promoList;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: ListTile(
          leading: const CircleAvatar(
            radius: 27,
            backgroundColor: kWhite,
            child: Icon(
              Icons.percent,
              color: kBlack,
            ),
          ),
          title: Text(
            promoList[index].promo,
            style: const TextStyle(fontSize: 17),
          ),
          subtitle: Text(promoList[index].details),
          trailing: const Icon(
            Icons.delete,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}

void showAddPromoCodeDialoge(context) async {
  final promocodeController = TextEditingController();
  final detailsController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> addPromoCode() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    await PromoCode.addPromoCode(
      percent: promocodeController.text.trim(),
      details: detailsController.text.trim(),
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Category Added Succeffuly'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: kBorderGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CommonHeading(text: 'Add Promo Code'),
                  kHeight10,
                  kHeight10,
                  CustomTextField(
                    controller: promocodeController,
                    hintText: 'Percentage',
                    icon: Icons.percent,
                    validator: (value) {
                      if (value != null && value.length < 2) {
                        return 'Enter a valid promocode';
                      } else if (int.parse(value!) > 25) {
                        return 'Enter a valid promocode';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kHeight20,
                  CustomTextField(
                    controller: detailsController,
                    hintText: 'offer validity',
                    icon: Icons.abc,
                    validator: (value) {
                      if (value != null && value.length < 4) {
                        return 'Enter a valid promocode';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kHeight20,
                  Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          buttonText: 'Cancel',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          bgColor: kSpecialGrey,
                        ),
                      ),
                      kWidth10,
                      Expanded(
                        child: CommonButton(
                          buttonText: 'Add',
                          onPressed: () async {
                            await addPromoCode();
                          },
                          bgColor: kWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
