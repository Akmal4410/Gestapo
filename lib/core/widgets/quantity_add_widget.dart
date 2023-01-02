import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class QuantityAddWidget extends StatefulWidget {
  const QuantityAddWidget({
    Key? key,
    required this.getQuantity,
    required this.currentQuantity,
  }) : super(key: key);
  final void Function(int) getQuantity;
  final int currentQuantity;

  @override
  State<QuantityAddWidget> createState() => _QuantityAddWidgetState();
}

class _QuantityAddWidgetState extends State<QuantityAddWidget> {
  late int quantity = widget.currentQuantity;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.25,
      height: screenHeight * 0.048,
      decoration: BoxDecoration(
        color: kSpecialGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Visibility(
            visible: !(quantity <= 1),
            child: GestureDetector(
              onTap: () {
                if (quantity <= 1) return;
                setState(() {
                  quantity = quantity - 1;
                  widget.getQuantity(quantity);
                });
              },
              child: const Icon(
                Icons.remove,
                color: kWhite,
              ),
            ),
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                quantity = quantity + 1;
                widget.getQuantity(quantity);
              });
            },
            child: const Icon(
              Icons.add,
              color: kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
